PYTHON ?= python3
N64DK_ROOT ?= /home/steve/projects/n64-decomp-kit
N64DK_PYTHON ?= $(N64DK_ROOT)/.venv/bin/python
N64DK := PYTHONPATH=$(N64DK_ROOT) $(N64DK_PYTHON) -m n64dk
ROM ?= Madden Football 64 (USA).z64

.PHONY: verify survey audit attack extract-assets candidates match match-c match-asm check report research research-functions-catalog research-functions

verify:
	$(PYTHON) tools/verify_rom.py "$(ROM)"

survey: verify
	$(N64DK) survey "$(ROM)" --out build/us/survey

audit: verify
	$(PYTHON) tools/audit_rom_layout.py "$(ROM)" build/us/survey/main_segment.bin
	$(PYTHON) tools/make_overlay_images.py

attack: audit
	$(PYTHON) tools/analyze_attack_surface.py

extract-assets: audit
	$(PYTHON) tools/extract_assets.py "$(ROM)" build/us/survey/main_segment.bin

candidates:
	$(PYTHON) tools/rank_overlay_candidates.py

match: match-c match-asm

match-c: audit
	$(PYTHON) tools/filter_manifest_sources.py \
		config/us/matching_ido_sources.tsv build/us/matching_ido_c_sources.tsv .c
	$(N64DK) match-batch --project . \
		--rom "$(ROM)" \
		config/us/matching_loader_kmc_units.tsv=kmc+builtin
	$(PYTHON) tools/make_analysis_rom.py build/us/survey/main_segment.bin build/us/main_unpacked.z64
	$(N64DK) match-batch --project . \
		--rom build/us/main_unpacked.z64 \
		--symbols build/us/survey/symbol_addrs.txt \
		--symbols config/us/functions_resident.toml \
		build/us/matching_ido_c_sources.tsv=ido5.3 \
		config/us/matching_kmc_units.tsv=kmc+builtin
	$(N64DK) match-batch --project . \
		--rom build/us/audit/overlay_1_link.z64 \
		--symbols build/us/survey/symbol_addrs.txt \
		--symbols build/us/audit/overlay_1_functions/symbol_addrs.txt \
		config/us/matching_overlay1_kmc_units.tsv=kmc+builtin
	$(N64DK) match-batch --project . \
		--rom build/us/audit/overlay_4.z64 \
		--symbols build/us/survey/symbol_addrs.txt \
		--symbols build/us/audit/overlay_4_functions/symbol_addrs.txt \
		config/us/matching_overlay4_kmc_units.tsv=kmc+builtin

match-asm: audit
	$(PYTHON) tools/filter_manifest_sources.py \
		config/us/matching_ido_sources.tsv build/us/matching_ido_asm_units.tsv .s
	$(N64DK) match-batch --project . \
		--rom "$(ROM)" \
		config/us/matching_loader_asm_units.tsv=as
	$(PYTHON) tools/make_analysis_rom.py build/us/survey/main_segment.bin build/us/main_unpacked.z64
	$(N64DK) match-batch --project . \
		--rom build/us/main_unpacked.z64 \
		--symbols build/us/survey/symbol_addrs.txt \
		build/us/matching_ido_asm_units.tsv=ido5.3 \
		config/us/matching_asm_units.tsv=as
	$(N64DK) match-batch --project . \
		--rom build/us/audit/overlay_1_link.z64 \
		--symbols build/us/survey/symbol_addrs.txt \
		--symbols build/us/audit/overlay_1_functions/symbol_addrs.txt \
		config/us/matching_overlay1_asm_units.tsv=as
	$(N64DK) match-batch --project . \
		--rom build/us/audit/overlay_4.z64 \
		--symbols build/us/survey/symbol_addrs.txt \
		--symbols build/us/audit/overlay_4_functions/symbol_addrs.txt \
		config/us/matching_overlay4_asm_units.tsv=as

check: verify
	$(PYTHON) -m unittest discover -s tests -v

report:
	$(PYTHON) tools/generate_decomp_report.py

research:
	$(PYTHON) tools/research_upstreams.py --rounds 500

research-functions-catalog: match
	$(PYTHON) tools/build_function_research_catalog.py

research-functions: research-functions-catalog
	$(PYTHON) tools/research_functions.py

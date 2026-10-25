PYTHON ?= python3
N64DK_ROOT ?= /home/steve/projects/n64-decomp-kit
N64DK_PYTHON ?= $(N64DK_ROOT)/.venv/bin/python
N64DK := PYTHONPATH=$(N64DK_ROOT) $(N64DK_PYTHON) -m n64dk
ROM ?= Madden Football 64 (USA).z64

.PHONY: verify survey audit attack candidates match check report research

verify:
	$(PYTHON) tools/verify_rom.py "$(ROM)"

survey: verify
	$(N64DK) survey "$(ROM)" --out build/us/survey

audit: verify
	$(PYTHON) tools/audit_rom_layout.py "$(ROM)" build/us/survey/main_segment.bin

attack: audit
	$(PYTHON) tools/analyze_attack_surface.py

candidates:
	$(PYTHON) tools/rank_overlay_candidates.py

match: audit
	$(N64DK) match-batch --project . \
		--rom "$(ROM)" \
		config/us/matching_loader_asm_units.tsv=as
	$(PYTHON) tools/make_analysis_rom.py build/us/survey/main_segment.bin build/us/main_unpacked.z64
	$(N64DK) match-batch --project . \
		--rom build/us/main_unpacked.z64 \
		--symbols build/us/survey/symbol_addrs.txt \
		config/us/matching_ido_sources.tsv=ido5.3 \
		config/us/matching_kmc_units.tsv=kmc+builtin \
		config/us/matching_asm_units.tsv=as
	$(N64DK) match-batch --project . \
		--rom build/us/audit/overlay_1.z64 \
		--symbols build/us/survey/symbol_addrs.txt \
		--symbols build/us/audit/overlay_1_functions/symbol_addrs.txt \
		config/us/matching_overlay1_kmc_units.tsv=kmc+builtin
	$(N64DK) match-batch --project . \
		--rom build/us/audit/overlay_4.z64 \
		--symbols build/us/survey/symbol_addrs.txt \
		--symbols build/us/audit/overlay_4_functions/symbol_addrs.txt \
		config/us/matching_overlay4_kmc_units.tsv=kmc+builtin

check: verify
	$(PYTHON) -m unittest discover -s tests -v

report:
	$(PYTHON) tools/generate_decomp_report.py

research:
	$(PYTHON) tools/research_upstreams.py --rounds 500

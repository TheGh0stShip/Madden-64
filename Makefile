PYTHON ?= python3
N64DK_ROOT ?= /home/steve/projects/n64-decomp-kit
N64DK_PYTHON ?= $(N64DK_ROOT)/.venv/bin/python
N64DK := PYTHONPATH=$(N64DK_ROOT) $(N64DK_PYTHON) -m n64dk
ROM ?= Madden Football 64 (USA).z64

.PHONY: verify survey match check

verify:
	$(PYTHON) tools/verify_rom.py "$(ROM)"

survey: verify
	$(N64DK) survey "$(ROM)" --out build/us/survey

match: verify
	$(PYTHON) tools/make_analysis_rom.py build/us/survey/main_segment.bin build/us/main_unpacked.z64
	$(N64DK) match-batch config/us/matching_ido_sources.tsv=ido5.3 --project . \
		--rom build/us/main_unpacked.z64 \
		--symbols build/us/survey/symbol_addrs.txt

check: verify
	$(PYTHON) -m unittest discover -s tests -v

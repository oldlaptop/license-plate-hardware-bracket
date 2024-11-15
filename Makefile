.POSIX:

MODEL = license-plate-hardware-bracket.stl
PREVIEW = license-plate-hardware-bracket.png

SOLVESPACE_OPTS = --chord-tol 0.01
PREVIEW_SIZE = 640x480
PREVIEW_DIRECTION = isometric

.SUFFIXES: .slvs .stl .png

.slvs.stl:
	solvespace-cli export-mesh --output %.stl $(SOLVESPACE_OPTS) $<
.slvs.png:
	solvespace-cli thumbnail --output %.png --size $(PREVIEW_SIZE) --view $(PREVIEW_DIRECTION) $(SOLVESPACE_OPTS) $<

default: model preview

model: $(MODEL)
preview: $(PREVIEW)

clean:
	rm -f $(MODEL) $(PREVIEW)

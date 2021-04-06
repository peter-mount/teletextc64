# ======================================================================
# Commodore 64 Teletext Emulator
# ======================================================================

TELETEXT	= teletext.prg		# C64 teletext module
SPLASH		= splash.prg		# Splash page in PRG format
TESTCARD	= testcard.prg		# Teletext test card in PRG format
ASCIICARD	= asciicard.prg		# Teletext ASCII chart Text mode
GRAPHICSCARD= graphicscard.prg	# Teletext ASCII chart Graphics mode
DISK		= testcard.d64

TELETEXTSRC = teletext.asm charset.asm

TARGETS = $(TELETEXT) $(SPLASH) $(TESTCARD) $(ASCIICARD) $(GRAPHICSCARD)

export CP				= @cp -p
export BEEBASM 			= beebasm
export BEEBASM_FLAGS	= -w
export C64_FLAGS		= $(BEEBASM_FLAGS) -D bbc=0 -D bbcmaster=0 -D c64=1
export C1541			= c1541

all: $(DISK)

clean:
	$(RM) $(TARGETS) $(DISK)

$(DISK): $(TARGETS)

# TELETEXT - the teletext emulator
$(TELETEXT): $(TELETEXTSRC)

# SPLASH - the splash screen
$(SPLASH): splash.asm

# TESTCARD - Debugging Teletext test card
$(TESTCARD): testcard.asm

$(ASCIICARD): asciicard.asm

$(GRAPHICSCARD): graphicscard.asm

# C64 assemble .prg executable
%.prg: %.asm
	$(BEEBASM) $(C64_FLAGS) -i $<

# C64 1541 disk image
# Files will be written to the image in the supplied order
%.d64:
	@$(C1541) -format $(shell basename $@),8 d64 $@
	@$(foreach file, $^, $(C1541) -attach $@ -write $(file) $(shell basename $(file) .prg|cut -f1 -d'_');)

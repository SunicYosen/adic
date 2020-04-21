# Make file for xor

BASE_DIR = $(abspath .)

PRO_NAME ?= xor
WORK_DIR ?= $(BASE_DIR)/$(PRO_NAME)

HSPICE  ?= hspice
HSPICE_OPTS = 

WAVEVIEW = wv 
WAVEVIEW_OPTS =

default: sim

sim: $(WORK_DIR)/$(PRO_NAME).tr0

wv: $(WORK_DIR)/$(PRO_NAME).log

$(WORK_DIR)/%.tr0: $(WORK_DIR)/%.sp
	cd $(WORK_DIR) && \
	$(HSPICE) $(HSPICE_OPTS) $^

$(WORK_DIR)/%.log: $(WORK_DIR)/%.tr0
	$(WAVEVIEW) $(WAVEVIEW_OPTS) -log $@ -wf $^ &

clean:
	cd $(WORK_DIR) && \
	rm *.ic* *.st* *.sw* *.pa* *.ms* *.log* *.tr* *.mt* -f

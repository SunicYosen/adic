#------------------------------------------------
# Makefile for hspice and wave view
# By: SunicYosen
#------------------------------------------------

BASE_DIR      ?= $(abspath .)
WORK_DIR      ?= $(BASE_DIR)/work
SP_DIR        ?= $(BASE_DIR)/sp

PRO_NAME      ?= invertor_test
PRO_WORK_DIR   = $(WORK_DIR)/$(PRO_NAME)

HSPICE        ?= hspice
HSPICE_OPTS   += -mt 4 -i
HSPICE_FILES   = $(SP_DIR)/*.sp \
                 $(SP_DIR)/*.vect

WAVEVIEW      ?= wv
WV_TYPE       ?= tr0
WV_LOG_FILE    = $(PRO_WORK_DIR)/$(PRO_NAME)_wv.log
WAVEVIEW_OPTS += -log $(WV_LOG_FILE)

default: sim
sim: $(PRO_WORK_DIR)/$(PRO_NAME).$(WV_TYPE)

#------------------------
# Simulation
#------------------------
$(PRO_WORK_DIR)/%.$(WV_TYPE): $(SP_DIR)/%.sp $(HSPICE_FILES)
	mkdir -p $(PRO_WORK_DIR) && \
	cd $(PRO_WORK_DIR) && \
	$(HSPICE) $(HSPICE_OPTS) $^

#------------------------
# Wave view
#------------------------
.PHONY: wv
wv:  $(PRO_WORK_DIR)/$(PRO_NAME).$(WV_TYPE)
	$(WAVEVIEW) $(WAVEVIEW_OPTS) -wf $^ &

#------------------------
# Clean
#------------------------
.PHONY: clean cleanwv cleanall
clean:
	rm -rf $(PRO_WORK_DIR)

cleanwv:
	rm $(PRO_WORK_DIR)/$(PRO_NAME)_wv.log
	
cleanall:
	rm -rf $(WORK_DIR)

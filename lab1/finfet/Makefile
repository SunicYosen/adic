# Make file for finfet

BASE_DIR = $(abspath .)
NFET_DIR = $(BASE_DIR)/nfet
PFET_DIR = $(BASE_DIR)/pfet

nfet_sp = $(NFET_DIR)/nfet.sp
pfet_sp = $(PFET_DIR)/pfet.sp

nfet_wv = $(NFET_DIR)/nfet.sw0
pfet_wv = $(PFET_DIR)/pfet.sw0

nfet_wv_log = $(NFET_DIR)/nfet_wv.log
pfet_wv_log = $(PFET_DIR)/pfet_wv.log

HSPICE  = hspice
HSPICE_OPTS = 

WAVEVIEW = wv 
WAVEVIEW_OPTS =

default: nfetsim

nfetsim: $(nfet_wv)

pfetsim: $(pfet_wv)

$(nfet_wv): $(nfet_sp)
	cd $(NFET_DIR) && \
	$(HSPICE) $(HSPICE_OPTS) $(nfet_sp)

nfetwv: $(nfet_wv)
	$(WAVEVIEW) $(WAVEVIEW_OPTS) -log $(nfet_wv_log) -wf $(nfet_wv) &

$(pfet_wv): $(pfet_sp)
	cd $(PFET_DIR) && \
	$(HSPICE) $(HSPICE_OPTS) $(pfet_sp)

pfetwv: $(pfet_wv)
	$(WAVEVIEW) $(WAVEVIEW_OPTS) -log $(pfet_wv_log) -wf $(pfet_wv) &

clean:
	cd $(NFET_DIR) && \
	rm *.ic* *.st* *.sw* *.pa* *.ms* *.log* -f
	cd $(PFET_DIR) && \
	rm *.ic* *.st* *.sw* *.pa* *.ms* *.log* -f

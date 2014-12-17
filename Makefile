PACKAGE = 3things

SASSC = sass
JSC = traceur
BOOTSTRAP_PATH = bower_components/bootstrap-sass-official/assets


.PHONY: all
all: styles js

# Build javascript
JSDIR = $(PACKAGE)/static/js
JSOUT = $(JSDIR)/build.js
JSVENDOR = $(JSDIR)/vendor.js
JSDEPS = \
	bower_components/jquery/dist/jquery.min.js \
	$(BOOTSTRAP_PATH)/javascripts/bootstrap.js

$(JSDIR)/vendor.js:
	cat $(JSDEPS) > $(JSDIR)/vendor.js

.PHONEY: js
js: $(JSVENDOR)

# Build stylesheets
STYLESRC = $(PACKAGE)/static/sass/screen.scss
STYLEOBJ = ${STYLESRC:.scss=.css}
STYLEOUT = $(PACKAGE)/static/css/screen.css
STYLELIB = $(BOOTSTRAP_PATH)/stylesheets

$(STYLEOUT): $(STYLEOBJ)
	cp $< $@

%.css: %.scss
	$(SASSC) -I $(STYLELIB) -C $< > $@

.PHONY: styles
styles: $(STYLEOUT)

.PHONY: clean
clean:
	-rm $(STYLEOBJ)
	-rm $(STYLEOUT)
	-rm $(JSVENDOR)

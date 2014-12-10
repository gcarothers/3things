SASSC = sass
PACKAGE = 3things
BOOTSTRAP_PATH = bower_components/bootstrap-sass-official/assets/stylesheets

# Build stylesheets
STYLESRC = $(PACKAGE)/static/sass/screen.scss
STYLEOBJ = ${STYLESRC:.scss=.css}
STYLEOUT = $(PACKAGE)/static/css/screen.css
STYLELIB = $(BOOTSTRAP_PATH)

$(STYLEOUT): $(STYLEOBJ)
	cp $< $@

%.css: %.scss
	$(SASSC) -I $(STYLELIB) -C $< > $@

.PHONY: styles
styles: $(STYLEOUT)


.PHONY: all
all: styles

.PHONY: clean
clean:
	-rm $(STYLEOBJ)
	-rm $(STYLEOUT)

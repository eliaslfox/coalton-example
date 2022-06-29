.PHONY: docs
docs:
	sbcl --noinform \
		 --non-interactive \
		 --eval "(ql:quickload :coalton-example :silent t)" \
		 --eval "(ql:quickload :coalton/doc :silent t)" \
		 --eval "(coalton-doc:write-documentation-to-file \
	              \"docs.md\" \
				  :packages '(coalton-example) \
				  :asdf-system :coalton-example \
				  :file-link-prefix \"https://github.com/eliaslfox/coalton-example/tree/main/src/\")"


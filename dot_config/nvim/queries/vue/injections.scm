; inherits html_tags
; <style lang="css">
; <style lang="scss">
((style_element
  (start_tag
    (attribute
      (attribute_name) @_lang
      (quoted_attribute_value
        (attribute_value) @injection.language)))
  (raw_text) @injection.content)
  (#eq? @_lang "lang")
  (#any-of? @injection.language "css" "scss"))

; TODO: When nvim-treesitter has postcss and less parsers, use @injection.language and @injection.content instead
; <style lang="less">
; <style lang="postcss">
(style_element
  (start_tag
    (attribute
      (attribute_name) @_lang
      (quoted_attribute_value
        (attribute_value) @_scss)))
  (raw_text) @injection.content
  (#eq? @_lang "lang")
  (#any-of? @_scss "less" "postcss")
  (#set! injection.language "scss"))

; <script lang="js">
; <script lang="jsx">
((script_element
  (start_tag
    (attribute
      (attribute_name) @_lang
      (quoted_attribute_value
        (attribute_value) @_js)))
  (raw_text) @injection.content)
  (#eq? @_lang "lang")
  (#any-of? @_js "js" "jsx")
  (#set! injection.language "javascript"))

; <script lang="ts">
; <script lang="tsx">
((script_element
  (start_tag
    (attribute
      (attribute_name) @_lang
      (quoted_attribute_value
        (attribute_value) @_ts)))
  (raw_text) @injection.content)
  (#eq? @_lang "lang")
  (#any-of? @_ts "ts" "tsx")
  (#set! injection.language "typescript"))

((interpolation
  (raw_text) @injection.content)
  (#set! injection.language "typescript"))

(directive_attribute
  (quoted_attribute_value
    (attribute_value) @injection.content
    (#set! injection.language "typescript")))

(template_element
  (start_tag
    (attribute
      (quoted_attribute_value
        (attribute_value) @injection.language)))
  (text) @injection.content
  (#eq? @injection.language "pug"))

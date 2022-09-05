<i18n>
  <span ref="localize"></span>
  <span ref="original" class="original"><yield/></span>
  <style scoped>
    .original {
      display: none;
    }
  </style>
  <script>
    import i18next from "i18next";

    this.on('mount', () => {
      i18next.on('update', this.update);
      this.localize();
    });

    this.on('unmount', () => {
      i18next.off('update', this.update);
    });

    this.on('updated', () => {
      console.log('<i18n> Tag updated to', this.opts.code)
      this.localize();
    });

    this.withPrefix = (prefix, path) => prefix ? `${prefix}.${path}` : path

    this.localize = () => {
      const key = this.withPrefix(this.opts.prefix ,this.refs.original.innerHTML);
      const options = { ns: this.opts.ns }

      let result = this.refs.original.innerHTML;

      if (i18next.exists(key, options)) {
        result = i18next.t(key, options)
      }

      // Replace parameters
      if (Array.isArray(this.opts.args)) {
        for (const arg in this.opts.args) {
          result = localized.replace(`{${i}}`, arg);
        }
      }

      // Replace localized word
      this.refs.localize.innerHTML = result;
    };
  </script>
</i18n>

<index>
  <div>
    <span><i18n>select</i18n>: </span>
    <i18n ns="enums" code="{ 'fruits.' + value }">{ opts.code }</i18n>
  </div>
  <form onchange="{ onSelect }">
    <select>
      <option each="{ option, o in options }">{ option }</option>
    </select>
  </form>
  <script>
    import { Fruits } from '../enums'

    this.options = Object.keys(Fruits)
    this.value = this.options[0]

    onSelect(e) {
      this.value = e.target.value
    }
  </script>
</index>

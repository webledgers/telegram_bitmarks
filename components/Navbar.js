import { html } from 'https://unpkg.com/spux?module'

export default function Navbar (props) {
  let title = props.title || 'Spux'
  return html`
    <div id="navbar" style="margin-top: -10px; margin-bottom: -10px;">
      <div class="bg-success pv2 row">
        <div class="col">
          <a href="#buttons" class="white ph2 bold">${title}</a>
        </div>
      </div>
    </div>
    <hr />
  `
}

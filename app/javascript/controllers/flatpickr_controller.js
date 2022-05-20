import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin'

export default class extends Controller {
  static values = {
    booked_dates: Array
  }


  connect() {
    this.pickerLoader()
  }

  pickerLoader() {
    flatpickr("#start", {
      minDate: "today",
      "plugins": [new rangePlugin({ input: '#end'})],
      disable: [this.booked_datesValue],
      dateFormat: "Y-m-d"
    })
  }
}

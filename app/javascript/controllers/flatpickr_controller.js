import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin'

export default class extends Controller {
  static values = {
    bookedDates: Array
  }


  connect() {
    this.pickerLoader()
    console.log(this.bookedDatesValue)
  }

  pickerLoader() {
    flatpickr("#start", {
      minDate: "today",
      "plugins": [new rangePlugin({ input: '#end'})],
      disable: this.bookedDatesValue,
      dateFormat: "Y-m-d"
    })
  }
}

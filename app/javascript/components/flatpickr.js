import flatpickr from "flatpickr";
import { Portuguese } from "flatpickr/dist/l10n/pt.js"

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    "locale": Portuguese,
    allowInput: true,
    enableTime: true
  });
}

export { initFlatpickr };
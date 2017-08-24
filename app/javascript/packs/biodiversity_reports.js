import Elm from '../biodiversity_reports/Main'

document.addEventListener('DOMContentLoaded', () => {
  const target = document.getElementById('biodiversity_report_temperature_slider')
  const app = Elm.Main.embed(target)
})

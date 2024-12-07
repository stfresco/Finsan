import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "amount" ]

  connect() {
    this.updateCurrencySymbol()
  }

  updateCurrencySymbol() {
    const currencySymbols = {
      'USD': '$',
      'EUR': '€',
      'JPY': '¥',
      'MXN': '$',
      'PEN': 'S/',
      'CLP': '$',
      'ARS': '$',
      'BRL': 'R$',
      'BOB': 'Bs',
      'GBP': '£',
      'CHF': 'Fr',
      'CAD': '$',
      'AUD': '$',
      'CNY': '¥',
      'INR': '₹',
      'RUB': '₽',
      'KRW': '₩',
      'SGD': '$',
      'MYR': 'RM',
      'SEK': 'kr',
      'NOK': 'kr',
      'COP': '$',
      'DKK': 'kr',
      'ESP': '₧',
      'TRY': '₺',
      'AED': 'د.إ',
      'ZAR': 'R',
      'THB': '฿',
      'HUF': 'Ft',
      'ISK': 'kr',
      'TWD': 'NT$',
      'PHP': '₱',
      'AWG': 'ƒ',
      'NZD': '$',
      'PKR': '₨',
      'KZT': '₸',
      'HKD': '$',
      'DZD': 'د.ج',
      'EGP': '£',
      'VND': '₫',
      'default': '$'
    }

    const amountElement = this.element.querySelector('.text-success.fs-5.fw-bold') || this.element;
    const amount = amountElement.textContent.trim();


    if (amountElement) {
      const currencyCode = this.getCurrencyCode()
      const currencySymbol = currencySymbols[currencyCode] || currencySymbols['default']

      // Eliminar cualquier símbolo o código de moneda existente
      let currentAmount = amount
        .replace(/^[A-Z]{3}\s*/, '')  // Eliminar código de moneda
        .replace(/^[$€¥£₹₽₩S\/Bs]+/, '')  // Eliminar símbolos
        .trim()

      // Reemplazar completamente el contenido
      amountElement.textContent = `${currencySymbol} ${currentAmount}`
    }
  }


  getCurrencyCode() {
    const currencyElement = this.element.dataset.currency; // Se obtiene directamente desde el dataset
    if (currencyElement) {
      return currencyElement.split(' - ')[0].trim(); // Elimina cualquier espacio
    }
    return 'default';
  }
}

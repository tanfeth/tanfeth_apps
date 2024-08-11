class PaymentMethodEnum {
  final String myfatoorah;
  final String cash;
  final String mada;
  final String visa;
  final String bankTransfer;
  final String wallet;

  const PaymentMethodEnum({
    this.myfatoorah = 'myfatoorah',
    this.bankTransfer = 'bank_transfer',
    this.cash = 'cash',
    this.mada = 'mada',
    this.visa = 'visa',
    this.wallet = 'wallet'
  });
}

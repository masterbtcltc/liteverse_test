import 'package:stackwallet/exceptions/exchange/exchange_exception.dart';

class PairUnavailableException extends ExchangeException {
  PairUnavailableException(super.message, super.type);
}

import 'package:flix_id/data/repositories/transaction_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/domain/usecases/get_transactions/get_transactions_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetTransactions implements Usecase<Result<List<Transaction>>, GetTransactionsParam> {
  final TransactionRepository _transactionRepository;

  GetTransactions({required TransactionRepository transactionRepository}) : _transactionRepository = transactionRepository;
  
  @override
  Future<Result<List<Transaction>>> call(GetTransactionsParam params) async {
    var transactionsListResult = await _transactionRepository.getUserTransaction(uid: params.uid);

    return switch (transactionsListResult){
      Success(value: final transactionsList) => Result.success(transactionsList),
      Failed(:final message) => Result.failed(message)
    };
  }



}
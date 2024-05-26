class OrdersStatusEnum {
  final String cancelByCustomer;
  final String cancelByDelegate;
  final String problem;
  final String review;
  final String waitingDriver;
  final String toReceive;
  final String received;
  final String rejected;
  final String completed;
  final String study;
  final String onWay;
  const OrdersStatusEnum({
    this.received = 'recived_receivables_transfered',
    this.review = 'under_review_by_administration',
    this.toReceive = 'driver_directed_to_receive',
    this.waitingDriver = 'price_accepted_by_customer_waiting_for_driver',
    this.problem = 'problamatic',
    this.cancelByDelegate = 'cancel_by_delegate',
    this.cancelByCustomer = 'canceled_by_customer',
    this.completed = 'completed',
    this.rejected = 'rejected_by_administration',
    this.study = 'under_study_by_administration',
    this.onWay = 'delegate_on_the_way',
  });
}

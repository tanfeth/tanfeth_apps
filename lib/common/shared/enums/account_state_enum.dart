

class AccountStateEnum {
  final String pending;
  final String  approved;
  final String  rejected;

  const AccountStateEnum({
    this.pending = "Pending",
    this.approved = 'Approved',
    this.rejected ="Rejected"
  });
}

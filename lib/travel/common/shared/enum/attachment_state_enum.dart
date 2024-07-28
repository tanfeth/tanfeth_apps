

class AttachmentStateEnum {
  final String empty;
  final String pending;
  final String approved;
  final String rejected;

  const AttachmentStateEnum({
    this.empty = 'Empty',
    this.pending = 'Pending',
    this.approved = 'Approved',
    this.rejected = 'Rejected'
  });
}

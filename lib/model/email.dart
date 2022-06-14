class Email {
  // super fake email class ¯\_(ツ)_/¯

   Email(this.sender, this.time, this.subject, this.message, this.avatar, this.recipients, this.id,this.courseid, this.hasAttachment,
      this.containsPictures, this.isRead);

  final String sender;
  final String time;
  final String subject;
  final String message;
  final String avatar;
  final String recipients;
  final int id;
  final int courseid;
  final bool hasAttachment;
  final bool containsPictures;
  bool isRead;
}
//email 寄件人 - 时间 - 主标题 - 信件内容（预览仅一行） - 头像 -
// - 收件人 - 是否有附件 - 是否包含图片 - 是否已读
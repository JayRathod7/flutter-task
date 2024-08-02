class EmailModel {
  final String? img;
  final String? name;
  final String? subject;
  final String? msg;
  final String? time;
  bool favorite = false;

  EmailModel(
      {required this.img,
      required this.name,
      required this.subject,
      required this.msg,
      required this.time,
      required this.favorite});
}

List<EmailModel> emailModel = [
  EmailModel(
      img: "assets/g.png",
      name: "Google",
      subject: "Security alert",
      msg:
          "We noticed a new sign-in to your Google Account on a Windows device. If this was you, you don’t need to do anything. If not, we’ll help you secure your account.",
      time: "9:10 AM",
      favorite: false),
  EmailModel(
      img: "assets/grow.png",
      name: "Groww",
      subject: "Contract Note for 19-07-2024",
      msg:
          "Here’s your contract note with details of all the successful trades for 19-07-2024.The document is password protected. To access it, please type in you",
      time: "2:10 AM",
      favorite: false),
  EmailModel(
      img: "assets/g.png",
      name: "Google",
      subject: "Security alert",
      msg:
          "We noticed a new sign-in to your Google Account on a Windows device. If this was you, you don’t need to do anything. If not, we’ll help you secure your account.",
      time: "9:10 AM",
      favorite: false),
  EmailModel(
      img: "assets/y.png",
      name: "Youtube",
      subject: "New login to Instagram from Instagram on Samsung SM-F415F",
      msg:
          "We noticed a new login, gujju_gujarati.1 We noticed a login from a device you don't usually use.",
      time: "6:30 PM",
      favorite: false),
  EmailModel(
      img: "assets/g.png",
      name: "Google",
      subject: "Security alert",
      msg:
          "We noticed a new sign-in to your Google Account on a Windows device. If this was you, you don’t need to do anything. If not, we’ll help you secure your account.",
      time: "9:10 AM",
      favorite: false),
  EmailModel(
      img: "assets/f.png",
      name: "Facebook",
      subject:
          "Annual reminder on CoinSwitch’s Terms of Service, Community Guidelines and Privacy Policy",
      msg:
          "We noticed a new sign-in to your Google Account on a Windows device. If this was you, you don’t need to do anything. If not, we’ll help you secure your account.",
      time: "9:56 PM",
      favorite: false),
  EmailModel(
      img: "assets/i.png",
      name: "Instagram",
      subject: "Discord Password Changed",
      msg:
          "What's up chhotabheem0024 We've channeled our psionic energy to change your Discord account password. Gonna go get a seltzer to calm down.",
      time: "10:56 PM",
      favorite: false),
  EmailModel(
      img: "assets/g.png",
      name: "Google",
      subject: "Security alert",
      msg:
          "We noticed a new sign-in to your Google Account on a Windows device. If this was you, you don’t need to do anything. If not, we’ll help you secure your account.",
      time: "9:10 AM",
      favorite: false),
  EmailModel(
      img: "assets/y.png",
      name: "Youtube",
      subject: "New login to Instagram from Instagram on Samsung SM-F415F",
      msg:
          "We noticed a new login, gujju_gujarati.1 We noticed a login from a device you don't usually use.",
      time: "6:30 PM",
      favorite: false),
  EmailModel(
      img: "assets/i.png",
      name: "Instagram",
      subject: "Discord Password Changed",
      msg:
          "What's up chhotabhe We've channeled our psionic energy to change your Discord account password. Gonna go get a seltzer to calm down.",
      time: "10:23 PM",
      favorite: false),
  EmailModel(
      img: "assets/f.png",
      name: "Facebook",
      subject:
          "Annual reminder on CoinSwitch’s Terms of Service, Community Guidelines and Privacy Policy",
      msg:
          "We noticed a new sign-in to your Google Account on a Windows device. If this was you, you don’t need to do anything. If not, we’ll help you secure your account.",
      time: "9:56 PM",
      favorite: false),
];

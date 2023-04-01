class User {
  String username;

  String role;
  User({required this.username, required this.role});
}

List<User> onlineusers = [
  User(username: 'Francis', role: 'Health Officer'),
  User(username: 'Augustine', role: 'Medical Officer'),
  User(username: 'Josephine', role: 'Health Officer'),
  User(username: 'Emmanuel', role: 'Accounts Officer'),
];

List<String> religion = [
  'Christianity',
  'Islam',
  'Judaism',
  'Hinduism',
  'Buddhism',
  'Folk religion',
  'Other'
];

List<String> gender = ['Male', 'Female', 'prefer not to say'];
var education = [
  'Basic level',
  'Secondary level',
  'Tertiary level',
  'Not educated'
];
List<String> maritalstatus = ['Single', 'Married', 'Prefer not to say'];

List<String> bloodgroups = [
  'A+',
  'A-',
  'B+',
  'B-',
  'AB+',
  'AB-',
  'O+',
  'O-',
];

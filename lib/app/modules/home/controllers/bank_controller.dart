import 'package:cash_vic/app/models/bank.dart';
import 'package:get/get.dart';

import '../../../services/ApiService.dart';
import '../../../widgets/data_store.dart';
import '../../../widgets/toast.dart';

class BankController extends GetxController {
  //TODO: Implement WalletController

  final apiService = Get.find<ApiService>();
  final banksAccountList = RxList<Bank>();

  Rx<String> currentBankName = ''.obs;
  Rx<String> currentIfsc = ''.obs;
  Rx<String> currentAccountName = ''.obs;
  Rx<String> currentAccountNumber = ''.obs;

  String? get bankName =>
      currentBankName.value!.isEmpty ? null : currentBankName.value;

  void setBankName(String name) {
    currentBankName.value = name;
  }

  void setAccountNumber(String name) {
    currentAccountNumber.value = name;
  }

  void setAccountName(String name) {
    currentAccountName.value = name;
  }

  void setIfsc(String name) {
    currentIfsc.value = name;
  }

  void UpdateBankDetails(Bank bank) {
    currentAccountName.value = bank.account_name;
    currentAccountNumber.value = bank.account_number;
    currentIfsc.value = bank.ifsc_code;
    currentBankName.value = bank.bank_name;
  }

  void saveBank({String? bankId = null}) async {
    if (currentBankName.value.isEmpty) {
      showToast('Please select bank name');
      return;
    } else if (currentAccountNumber.value.isEmpty) {
      showToast('Please enter account number');
      return;
    } else if (currentAccountName.value.isEmpty) {
      showToast('Please enter account name');
      return;
    } else if (currentIfsc.value.isEmpty) {
      showToast('Please enter IFSC code');
      return;
    }
    AddBank(
      bankName: currentBankName.value,
      accountNumber: currentAccountNumber.value,
      ifscCode: currentIfsc.value,
      accountName: currentAccountName.value,
      bankId: bankId,
    );
  }

  var bank = [
    " ABHYUDAYA CO-OP BANK LTD",
    " ABU DHABI COMMERCIAL BANK",
    " AKOLA DISTRICT CENTRAL CO-OPERATIVE BANK",
    " AKOLA JANATA COMMERCIAL COOPERATIVE BANK",
    " ALLAHABAD BANK",
    " ALMORA URBAN CO-OPERATIVE BANK LTD.",
    " ANDHRA BANK",
    " ANDHRA PRAGATHI GRAMEENA BANK",
    " APNA SAHAKARI BANK LTD",
    " AUSTRALIA AND NEW ZEALAND BANKING GROUP LIMITED.",
    " AXIS BANK",
    " BANK INTERNASIONAL INDONESIA",
    " BANK OF AMERICA",
    " BANK OF BAHRAIN AND KUWAIT",
    " BANK OF BARODA",
    " BANK OF CEYLON",
    " BANK OF INDIA",
    " BANK OF MAHARASHTRA",
    " BANK OF TOKYO-MITSUBISHI UFJ LTD.",
    " BARCLAYS BANK PLC",
    " BASSEIN CATHOLIC CO-OP BANK LTD",
    " BHARATIYA MAHILA BANK LIMITED",
    " BNP PARIBAS",
    " CALYON BANK",
    " CANARA BANK",
    " CAPITAL LOCAL AREA BANK LTD.",
    " CATHOLIC SYRIAN BANK LTD.",
    " CENTRAL BANK OF INDIA",
    " CHINATRUST COMMERCIAL BANK",
    " CITIBANK NA",
    " CITIZENCREDIT CO-OPERATIVE BANK LTD",
    " CITY UNION BANK LTD",
    " COMMONWEALTH BANK OF AUSTRALIA",
    " CORPORATION BANK",
    " CREDIT SUISSE AG",
    " DBS BANK LTD",
    " DENA BANK",
    " DEUTSCHE BANK",
    " DEUTSCHE SECURITIES INDIA PRIVATE LIMITED",
    " DEVELOPMENT CREDIT BANK LIMITED",
    " DHANLAXMI BANK LTD",
    " DICGC",
    " DOMBIVLI NAGARI SAHAKARI BANK LIMITED",
    " FIRSTRAND BANK LIMITED",
    " GOPINATH PATIL PARSIK JANATA SAHAKARI BANK LTD",
    " GURGAON GRAMIN BANK",
    " HDFC BANK LTD",
    " HSBC",
    " ICICI BANK LTD",
    " IDBI BANK LTD",
    " IDRBT",
    " INDIAN BANK",
    " INDIAN OVERSEAS BANK",
    " INDUSIND BANK LTD",
    " INDUSTRIAL AND COMMERCIAL BANK OF CHINA LIMITED",
    " ING VYSYA BANK LTD",
    " JALGAON JANATA SAHKARI BANK LTD",
    " JANAKALYAN SAHAKARI BANK LTD",
    " JANASEVA SAHAKARI BANK (BORIVLI) LTD",
    " JANASEVA SAHAKARI BANK LTD. PUNE",
    " JANATA SAHAKARI BANK LTD (PUNE)",
    " JPMORGAN CHASE BANK N.A",
    " KALLAPPANNA AWADE ICH JANATA S BANK",
    " KAPOL CO OP BANK",
    " KARNATAKA BANK LTD",
    " KARNATAKA VIKAS GRAMEENA BANK",
    " KARUR VYSYA BANK",
    " KOTAK MAHINDRA BANK",
    " KURMANCHAL NAGAR SAHKARI BANK LTD",
    " MAHANAGAR CO-OP BANK LTD",
    " MAHARASHTRA STATE CO OPERATIVE BANK",
    " MASHREQBANK PSC",
    " MIZUHO CORPORATE BANK LTD",
    " MUMBAI DISTRICT CENTRAL CO-OP. BANK LTD.",
    " NAGPUR NAGRIK SAHAKARI BANK LTD",
    " NATIONAL AUSTRALIA BANK",
    " NEW INDIA CO-OPERATIVE BANK LTD.",
    " NKGSB CO-OP BANK LTD",
    " NORTH MALABAR GRAMIN BANK",
    " NUTAN NAGARIK SAHAKARI BANK LTD",
    " OMAN INTERNATIONAL BANK SAOG",
    " ORIENTAL BANK OF COMMERCE",
    " PARSIK JANATA SAHAKARI BANK LTD",
    " PRATHAMA BANK",
    " PRIME CO OPERATIVE BANK LTD",
    " PUNJAB AND MAHARASHTRA CO-OP BANK LTD.",
    " PUNJAB AND SIND BANK",
    " PUNJAB NATIONAL BANK",
    " RABOBANK INTERNATIONAL (CCRB)",
    " RAJGURUNAGAR SAHAKARI BANK LTD.",
    " RAJKOT NAGARIK SAHAKARI BANK LTD",
    " RESERVE BANK OF INDIA",
    " SBERBANK",
    " SHINHAN BANK",
    " SHRI CHHATRAPATI RAJARSHI SHAHU URBAN CO-OP BANK LTD",
    " SOCIETE GENERALE",
    " SOLAPUR JANATA SAHKARI BANK LTD.SOLAPUR",
    " SOUTH INDIAN BANK",
    " STANDARD CHARTERED BANK",
    " STATE BANK OF BIKANER AND JAIPUR",
    " STATE BANK OF HYDERABAD",
    " STATE BANK OF INDIA",
    " STATE BANK OF MAURITIUS LTD",
    " STATE BANK OF MYSORE",
    " STATE BANK OF PATIALA",
    " STATE BANK OF TRAVANCORE",
    " SUMITOMO MITSUI BANKING CORPORATION",
    " SYNDICATE BANK",
    " TAMILNAD MERCANTILE BANK LTD",
    " THANE BHARAT SAHAKARI BANK LTD",
    " THE A.P. MAHESH CO-OP URBAN BANK LTD.",
    " THE AHMEDABAD MERCANTILE CO-OPERATIVE BANK LTD.",
    " THE ANDHRA PRADESH STATE COOP BANK LTD",
    " THE BANK OF NOVA SCOTIA",
    " THE BANK OF RAJASTHAN LTD",
    " THE BHARAT CO-OPERATIVE BANK (MUMBAI) LTD",
    " THE COSMOS CO-OPERATIVE BANK LTD.",
    " THE DELHI STATE COOPERATIVE BANK LTD.",
    " THE FEDERAL BANK LTD",
    " THE GADCHIROLI DISTRICT CENTRAL COOPERATIVE BANK LTD",
    " THE GREATER BOMBAY CO-OP. BANK LTD",
    " THE GUJARAT STATE CO-OPERATIVE BANK LTD",
    " THE JALGAON PEOPLES CO-OP BANK",
    " THE JAMMU AND KASHMIR BANK LTD",
    " THE KALUPUR COMMERCIAL CO. OP. BANK LTD.",
    " THE KALYAN JANATA SAHAKARI BANK LTD.",
    " THE KANGRA CENTRAL CO-OPERATIVE BANK LTD",
    " THE KANGRA COOPERATIVE BANK LTD",
    " THE KARAD URBAN CO-OP BANK LTD",
    " THE KARNATAKA STATE APEX COOP. BANK LTD.",
    " THE LAKSHMI VILAS BANK LTD",
    " THE MEHSANA URBAN COOPERATIVE BANK LTD",
    " THE MUNICIPAL CO OPERATIVE BANK LTD MUMBAI",
    " THE NAINITAL BANK LIMITED",
    " THE NASIK MERCHANTS CO-OP BANK LTD. NASHIK",
    " THE RAJASTHAN STATE COOPERATIVE BANK LTD.",
    " THE RATNAKAR BANK LTD",
    " THE ROYAL BANK OF SCOTLAND N.V",
    " THE SAHEBRAO DESHMUKH CO-OP. BANK LTD.",
    " THE SARASWAT CO-OPERATIVE BANK LTD",
    " THE SEVA VIKAS CO-OPERATIVE BANK LTD (SVB)",
    " THE SHAMRAO VITHAL CO-OPERATIVE BANK LTD",
    " THE SURAT DISTRICT CO OPERATIVE BANK LTD.",
    " THE SURAT PEOPLES CO-OP BANK LTD",
    " THE SUTEX CO.OP. BANK LTD.",
    " THE TAMILNADU STATE APEX COOPERATIVE BANK LIMITED",
    " THE THANE DISTRICT CENTRAL CO-OP BANK LTD",
    " THE THANE JANATA SAHAKARI BANK LTD",
    " THE VARACHHA CO-OP. BANK LTD.",
    " THE VISHWESHWAR SAHAKARI BANK LTD. PUNE",
    " THE WEST BENGAL STATE COOPERATIVE BANK LTD",
    " TJSB SAHAKARI BANK LTD.",
    " TUMKUR GRAIN MERCHANTS COOPERATIVE BANK LTD.",
    " UBS AG",
    " UCO BANK",
    " UNION BANK OF INDIA",
    " UNITED BANK OF INDIA",
    " UNITED OVERSEAS BANK",
    " VASAI VIKAS SAHAKARI BANK LTD.",
    " VIJAYA BANK",
    " WEST BENGAL STATE COOPERATIVE BANK",
    " WESTPAC BANKING CORPORATION",
    " WOORI BANK",
    " YES BANK LTD",
    " ZILA SAHKARI BANK LTD GHAZIABAD",
  ].obs;

  AddBank(
      {required String bankName,
      required String accountNumber,
      required String ifscCode,
      required String accountName,
      String? bankId = null}) async {
    try {
      var response = await apiService.apiManager.addBank(
        userId: userID(),
        bankName: bankName,
        ifscCode: ifscCode,
        accountNumber: accountNumber,
        accountName: accountName,
        bankId: bankId,
      );
      print(response);
      FetchBanks();
      Get.back();
    } catch (e) {
      showToast(e.toString());
    }
  }

  FetchBanks() async {
    banksAccountList.clear();
    final data = await apiService.apiManager.fetchBanks(userID());
    for (var item in data['data']) {
      banksAccountList.add(Bank.fromJson(item));
    }
    print(banksAccountList.value);
  }

  @override
  void onInit() {
    super.onInit();
    FetchBanks();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

import 'dart:convert';

class Product {
  String? q;
  int? from;
  int? to;
  bool? more;
  int? count;
  late List<Hits> _hits;
  List<Hits> get hits=>_hits;

  Product({this.q, this.from, this.to, this.more, this.count, required hits}){
    this._hits = hits;
  }

  Product.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    from = json['from'];
    to = json['to'];
    more = json['more'];
    count = json['count'];
    if (json['hits'] != null) {
      _hits = <Hits>[];
      json['hits'].forEach((v) {
        _hits!.add(new Hits.fromJson(v));
      });
    }
  }

}

class Hits {
  Recipe? recipe;

  Hits({this.recipe});

  Hits.fromJson(Map<String, dynamic> json) {
    recipe =
    json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
  }

}

class Recipe {
  String? uri;
  String? label;
  String? image;
  String? source;
  String? url;
  String? shareAs;
  double? yield;
  List<String>? dietLabels;
  List<String>? healthLabels;
  List<String>? cautions;
  List<String>? ingredientLines;
  List<Ingredients>? ingredients;
  double? calories;
  double? totalWeight;
  double? totalTime;
  List<String>? cuisineType;
  List<String>? mealType;
  List<String>? dishType;
  TotalNutrients? totalNutrients;
  TotalDaily? totalDaily;
  List<Digest>? digest;

  Recipe(
      {this.uri,
        this.label,
        this.image,
        this.source,
        this.url,
        this.shareAs,
        this.yield,
        this.dietLabels,
        this.healthLabels,
        this.cautions,
        this.ingredientLines,
        this.ingredients,
        this.calories,
        this.totalWeight,
        this.totalTime,
        this.cuisineType,
        this.mealType,
        this.dishType,
        this.totalNutrients,
        this.totalDaily,
        this.digest});

  Recipe.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    label = json['label'];
    image = json['image'];
    source = json['source'];
    url = json['url'];
    shareAs = json['shareAs'];
    yield = json['yield'];
    dietLabels = json['dietLabels'].cast<String>();
    healthLabels = json['healthLabels'].cast<String>();
    cautions = json['cautions'].cast<String>();
    ingredientLines = json['ingredientLines'].cast<String>();
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    calories = json['calories'];
    totalWeight = json['totalWeight'];
    totalTime = json['totalTime'];
    cuisineType = json['cuisineType'].cast<String>();
    mealType = json['mealType'].cast<String>();
    dishType = json['dishType'].cast<String>();
    totalNutrients = json['totalNutrients'] != null
        ? new TotalNutrients.fromJson(json['totalNutrients'])
        : null;
    totalDaily = json['totalDaily'] != null
        ? new TotalDaily.fromJson(json['totalDaily'])
        : null;
    if (json['digest'] != null) {
      digest = <Digest>[];
      json['digest'].forEach((v) {
        digest!.add(new Digest.fromJson(v));
      });
    }
  }

}

class Ingredients {
  String? text;
  double? quantity;
  String? measure;
  String? food;
  double? weight;
  String? foodCategory;
  String? foodId;
  String? image;

  Ingredients(
      {this.text,
        this.quantity,
        this.measure,
        this.food,
        this.weight,
        this.foodCategory,
        this.foodId,
        this.image});

  Ingredients.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    quantity = json['quantity'];
    measure = json['measure'];
    food = json['food'];
    weight = json['weight'];
    foodCategory = json['foodCategory'];
    foodId = json['foodId'];
    image = json['image'];
  }
}

class TotalNutrients {
  ENERCKCAL? eNERCKCAL;
  ENERCKCAL? fAT;
  ENERCKCAL? fASAT;
  ENERCKCAL? fATRN;
  ENERCKCAL? fAMS;
  ENERCKCAL? fAPU;
  ENERCKCAL? cHOCDF;
  ENERCKCAL? cHOCDFNet;
  ENERCKCAL? fIBTG;
  ENERCKCAL? sUGAR;
  SUGARAdded? sUGARAdded;
  ENERCKCAL? pROCNT;
  ENERCKCAL? cHOLE;
  ENERCKCAL? nA;
  ENERCKCAL? cA;
  ENERCKCAL? mG;
  ENERCKCAL? k;
  ENERCKCAL? fE;
  ENERCKCAL? zN;
  ENERCKCAL? p;
  ENERCKCAL? vITARAE;
  ENERCKCAL? vITC;
  ENERCKCAL? tHIA;
  ENERCKCAL? rIBF;
  ENERCKCAL? nIA;
  ENERCKCAL? vITB6A;
  ENERCKCAL? fOLDFE;
  ENERCKCAL? fOLFD;
  SUGARAdded? fOLAC;
  ENERCKCAL? vITB12;
  ENERCKCAL? vITD;
  ENERCKCAL? tOCPHA;
  ENERCKCAL? vITK1;
  SUGARAdded? sugarAlcohol;
  ENERCKCAL? wATER;

  TotalNutrients(
      {this.eNERCKCAL,
        this.fAT,
        this.fASAT,
        this.fATRN,
        this.fAMS,
        this.fAPU,
        this.cHOCDF,
        this.cHOCDFNet,
        this.fIBTG,
        this.sUGAR,
        this.sUGARAdded,
        this.pROCNT,
        this.cHOLE,
        this.nA,
        this.cA,
        this.mG,
        this.k,
        this.fE,
        this.zN,
        this.p,
        this.vITARAE,
        this.vITC,
        this.tHIA,
        this.rIBF,
        this.nIA,
        this.vITB6A,
        this.fOLDFE,
        this.fOLFD,
        this.fOLAC,
        this.vITB12,
        this.vITD,
        this.tOCPHA,
        this.vITK1,
        this.sugarAlcohol,
        this.wATER});

  TotalNutrients.fromJson(Map<String, dynamic> json) {
    eNERCKCAL = json['ENERC_KCAL'] != null
        ? new ENERCKCAL.fromJson(json['ENERC_KCAL'])
        : null;
    fAT = json['FAT'] != null ? new ENERCKCAL.fromJson(json['FAT']) : null;
    fASAT =
    json['FASAT'] != null ? new ENERCKCAL.fromJson(json['FASAT']) : null;
    fATRN =
    json['FATRN'] != null ? new ENERCKCAL.fromJson(json['FATRN']) : null;
    fAMS = json['FAMS'] != null ? new ENERCKCAL.fromJson(json['FAMS']) : null;
    fAPU = json['FAPU'] != null ? new ENERCKCAL.fromJson(json['FAPU']) : null;
    cHOCDF =
    json['CHOCDF'] != null ? new ENERCKCAL.fromJson(json['CHOCDF']) : null;
    cHOCDFNet = json['CHOCDF.net'] != null
        ? new ENERCKCAL.fromJson(json['CHOCDF.net'])
        : null;
    fIBTG =
    json['FIBTG'] != null ? new ENERCKCAL.fromJson(json['FIBTG']) : null;
    sUGAR =
    json['SUGAR'] != null ? new ENERCKCAL.fromJson(json['SUGAR']) : null;
    sUGARAdded = json['SUGAR.added'] != null
        ? new SUGARAdded.fromJson(json['SUGAR.added'])
        : null;
    pROCNT =
    json['PROCNT'] != null ? new ENERCKCAL.fromJson(json['PROCNT']) : null;
    cHOLE =
    json['CHOLE'] != null ? new ENERCKCAL.fromJson(json['CHOLE']) : null;
    nA = json['NA'] != null ? new ENERCKCAL.fromJson(json['NA']) : null;
    cA = json['CA'] != null ? new ENERCKCAL.fromJson(json['CA']) : null;
    mG = json['MG'] != null ? new ENERCKCAL.fromJson(json['MG']) : null;
    k = json['K'] != null ? new ENERCKCAL.fromJson(json['K']) : null;
    fE = json['FE'] != null ? new ENERCKCAL.fromJson(json['FE']) : null;
    zN = json['ZN'] != null ? new ENERCKCAL.fromJson(json['ZN']) : null;
    p = json['P'] != null ? new ENERCKCAL.fromJson(json['P']) : null;
    vITARAE = json['VITA_RAE'] != null
        ? new ENERCKCAL.fromJson(json['VITA_RAE'])
        : null;
    vITC = json['VITC'] != null ? new ENERCKCAL.fromJson(json['VITC']) : null;
    tHIA = json['THIA'] != null ? new ENERCKCAL.fromJson(json['THIA']) : null;
    rIBF = json['RIBF'] != null ? new ENERCKCAL.fromJson(json['RIBF']) : null;
    nIA = json['NIA'] != null ? new ENERCKCAL.fromJson(json['NIA']) : null;
    vITB6A =
    json['VITB6A'] != null ? new ENERCKCAL.fromJson(json['VITB6A']) : null;
    fOLDFE =
    json['FOLDFE'] != null ? new ENERCKCAL.fromJson(json['FOLDFE']) : null;
    fOLFD =
    json['FOLFD'] != null ? new ENERCKCAL.fromJson(json['FOLFD']) : null;
    fOLAC =
    json['FOLAC'] != null ? new SUGARAdded.fromJson(json['FOLAC']) : null;
    vITB12 =
    json['VITB12'] != null ? new ENERCKCAL.fromJson(json['VITB12']) : null;
    vITD = json['VITD'] != null ? new ENERCKCAL.fromJson(json['VITD']) : null;
    tOCPHA =
    json['TOCPHA'] != null ? new ENERCKCAL.fromJson(json['TOCPHA']) : null;
    vITK1 =
    json['VITK1'] != null ? new ENERCKCAL.fromJson(json['VITK1']) : null;
    sugarAlcohol = json['Sugar.alcohol'] != null
        ? new SUGARAdded.fromJson(json['Sugar.alcohol'])
        : null;
    wATER =
    json['WATER'] != null ? new ENERCKCAL.fromJson(json['WATER']) : null;
  }
}

class ENERCKCAL {
  String? label;
  double? quantity;
  String? unit;

  ENERCKCAL({this.label, this.quantity, this.unit});

  ENERCKCAL.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }


}

class SUGARAdded {
  String? label;
  double? quantity;
  String? unit;

  SUGARAdded({this.label, this.quantity, this.unit});

  SUGARAdded.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }

}

class TotalDaily {
  ENERCKCAL? eNERCKCAL;
  ENERCKCAL? fAT;
  ENERCKCAL? fASAT;
  ENERCKCAL? cHOCDF;
  ENERCKCAL? fIBTG;
  ENERCKCAL? pROCNT;
  ENERCKCAL? cHOLE;
  ENERCKCAL? nA;
  ENERCKCAL? cA;
  ENERCKCAL? mG;
  ENERCKCAL? k;
  ENERCKCAL? fE;
  ENERCKCAL? zN;
  ENERCKCAL? p;
  ENERCKCAL? vITARAE;
  ENERCKCAL? vITC;
  ENERCKCAL? tHIA;
  ENERCKCAL? rIBF;
  ENERCKCAL? nIA;
  ENERCKCAL? vITB6A;
  ENERCKCAL? fOLDFE;
  ENERCKCAL? vITB12;
  ENERCKCAL? vITD;
  ENERCKCAL? tOCPHA;
  ENERCKCAL? vITK1;

  TotalDaily(
      {this.eNERCKCAL,
        this.fAT,
        this.fASAT,
        this.cHOCDF,
        this.fIBTG,
        this.pROCNT,
        this.cHOLE,
        this.nA,
        this.cA,
        this.mG,
        this.k,
        this.fE,
        this.zN,
        this.p,
        this.vITARAE,
        this.vITC,
        this.tHIA,
        this.rIBF,
        this.nIA,
        this.vITB6A,
        this.fOLDFE,
        this.vITB12,
        this.vITD,
        this.tOCPHA,
        this.vITK1});

  TotalDaily.fromJson(Map<String, dynamic> json) {
    eNERCKCAL = json['ENERC_KCAL'] != null
        ? new ENERCKCAL.fromJson(json['ENERC_KCAL'])
        : null;
    fAT = json['FAT'] != null ? new ENERCKCAL.fromJson(json['FAT']) : null;
    fASAT =
    json['FASAT'] != null ? new ENERCKCAL.fromJson(json['FASAT']) : null;
    cHOCDF =
    json['CHOCDF'] != null ? new ENERCKCAL.fromJson(json['CHOCDF']) : null;
    fIBTG =
    json['FIBTG'] != null ? new ENERCKCAL.fromJson(json['FIBTG']) : null;
    pROCNT =
    json['PROCNT'] != null ? new ENERCKCAL.fromJson(json['PROCNT']) : null;
    cHOLE =
    json['CHOLE'] != null ? new ENERCKCAL.fromJson(json['CHOLE']) : null;
    nA = json['NA'] != null ? new ENERCKCAL.fromJson(json['NA']) : null;
    cA = json['CA'] != null ? new ENERCKCAL.fromJson(json['CA']) : null;
    mG = json['MG'] != null ? new ENERCKCAL.fromJson(json['MG']) : null;
    k = json['K'] != null ? new ENERCKCAL.fromJson(json['K']) : null;
    fE = json['FE'] != null ? new ENERCKCAL.fromJson(json['FE']) : null;
    zN = json['ZN'] != null ? new ENERCKCAL.fromJson(json['ZN']) : null;
    p = json['P'] != null ? new ENERCKCAL.fromJson(json['P']) : null;
    vITARAE = json['VITA_RAE'] != null
        ? new ENERCKCAL.fromJson(json['VITA_RAE'])
        : null;
    vITC = json['VITC'] != null ? new ENERCKCAL.fromJson(json['VITC']) : null;
    tHIA = json['THIA'] != null ? new ENERCKCAL.fromJson(json['THIA']) : null;
    rIBF = json['RIBF'] != null ? new ENERCKCAL.fromJson(json['RIBF']) : null;
    nIA = json['NIA'] != null ? new ENERCKCAL.fromJson(json['NIA']) : null;
    vITB6A =
    json['VITB6A'] != null ? new ENERCKCAL.fromJson(json['VITB6A']) : null;
    fOLDFE =
    json['FOLDFE'] != null ? new ENERCKCAL.fromJson(json['FOLDFE']) : null;
    vITB12 =
    json['VITB12'] != null ? new ENERCKCAL.fromJson(json['VITB12']) : null;
    vITD = json['VITD'] != null ? new ENERCKCAL.fromJson(json['VITD']) : null;
    tOCPHA =
    json['TOCPHA'] != null ? new ENERCKCAL.fromJson(json['TOCPHA']) : null;
    vITK1 =
    json['VITK1'] != null ? new ENERCKCAL.fromJson(json['VITK1']) : null;
  }

}

class Digest {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRDI;
  double? daily;
  String? unit;
  List<Sub>? sub;

  Digest(
      {this.label,
        this.tag,
        this.schemaOrgTag,
        this.total,
        this.hasRDI,
        this.daily,
        this.unit,
        this.sub});

  Digest.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'];
    hasRDI = json['hasRDI'];
    daily = json['daily'];
    unit = json['unit'];
    if (json['sub'] != null) {
      sub = <Sub>[];
      json['sub'].forEach((v) {
        sub!.add(new Sub.fromJson(v));
      });
    }
  }


}

class Sub {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRDI;
  double? daily;
  String? unit;

  Sub(
      {this.label,
        this.tag,
        this.schemaOrgTag,
        this.total,
        this.hasRDI,
        this.daily,
        this.unit});

  Sub.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'];
    hasRDI = json['hasRDI'];
    daily = json['daily'];
    unit = json['unit'];
  }
}


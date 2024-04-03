class ProductModel {
  final int productId;
  final String productUrlImage;
  final String productName;
  final String productArticle;
  final String productDesc;
  final double productWeight;
  final int typeProductId;
  final int warehouseId;
  final double productCost;

  ProductModel(
      {required this.productId,
      required this.productUrlImage,
      required this.productName,
      required this.productArticle,
      required this.productDesc,
      required this.productWeight,
      required this.typeProductId,
      required this.warehouseId,
      required this.productCost});


  static List<ProductModel> getProducts() {
    List<ProductModel> list = [];
    list.addAll([
      ProductModel(
        productId: 1,
        productUrlImage:
            "https://ir.ozone.ru/s3/multimedia-1-9/wc1000/6955055901.jpg",
        productName: "Ершик для унитаза",
        productArticle: "101657038",
        productDesc:
            "Многофункциональный ершик бренда 'МД Маркет' обеспечит эффективное очищение даже самых труднодоступных мест. Уникальное приспособление с пятью рабочими поверхностями с легкостью моется и не вызывает сложностей в процессе эксплуатации. Антибактериальный, мягкий и гибкий аксессуар отлично справляется с возложенными на него задачами. В набор входит три предмета. Помимо самого ершика в комплект включено крепление на стену и мягкая салфетка из микрофибры. Держатель не нуждается в сверлении.",
        productWeight: 1.6,
        typeProductId: 1,
        warehouseId: 1,
        productCost: 307,
      ),
      ProductModel(
        productId: 2,
        productUrlImage:
            "https://ir.ozone.ru/s3/multimedia-2/wc1000/6759858158.jpg",
        productName: "Крем-гель Dove",
        productArticle: "109977038",
        productDesc:
            "Крем-гель для душа Глубокое питание и увлажнение от Dove на основе увлажняющей формулы с сывороткой тройного увлажнения глубоко*** и бережно очищает и питает даже самую сухую кожу.",
        productWeight: 0.4,
        typeProductId: 2,
        warehouseId: 2,
        productCost: 299,
      ),
      ProductModel(
        productId: 3,
        productUrlImage:
            "https://ir.ozone.ru/s3/multimedia-p/wc1000/6736839865.jpg",
        productName: "Гель для стирки белья dr.Zhosh",
        productArticle: "190057038",
        productDesc:
            "Хороший гель для стирки белья.",
        productWeight: 0.6,
        typeProductId: 3,
        warehouseId: 3,
        productCost: 569,
      ),
      ProductModel(
        productId: 4,
        productUrlImage:
            "https://ir.ozone.ru/s3/multimedia-1-c/wc1000/6916789884.jpg",
        productName: "Стекло на телефон (3 шт.)",
        productArticle: "101666528",
        productDesc:
            "Хорошие стекла из лучших и премиальных материалов.",
        productWeight: 0.2,
        typeProductId: 4,
        warehouseId: 4,
        productCost: 195,
      ),
      ProductModel(
        productId: 5,
        productUrlImage:
            "https://ir.ozone.ru/s3/multimedia-i/wc1000/6809549130.jpg",
        productName: "Магний хелат",
        productArticle: "887367038",
        productDesc:
            "Основная функциoя Магния – поддержка нервной системы и повышение устойчивости организма к стрессу. Если уровень магния понижен, то нам сложнее справляться с эмоциональным перенапряжением и физическими нагрузками. Возможны и более серьезные последствия: судороги, повышение артериального давления, нарушение сердечного ритма, появление риска развития остеопороза, инфарктов и инсультов.",
        productWeight: 0.8,
        typeProductId: 5,
        warehouseId: 5,
        productCost: 1657,
      ),
    ]);
    return list;
  }
}

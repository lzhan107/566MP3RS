package entity;

import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.3.2.v20111125-r10461", date="2013-04-14T00:44:05")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, BigDecimal> markup;
    public static volatile SingularAttribute<Product, Integer> quantityOnHand;
    public static volatile SingularAttribute<Product, Integer> manufacturerId;
    public static volatile SingularAttribute<Product, String> productCode;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile SingularAttribute<Product, BigDecimal> purchaseCost;
    public static volatile SingularAttribute<Product, String> available;
    public static volatile SingularAttribute<Product, Integer> productId;

}
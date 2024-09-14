package com.tth.pojo;

import com.tth.pojo.Product;
import com.tth.pojo.Tag;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-09-10T17:13:40")
@StaticMetamodel(ProductTag.class)
public class ProductTag_ { 

    public static volatile SingularAttribute<ProductTag, Product> productId;
    public static volatile SingularAttribute<ProductTag, Tag> tagId;
    public static volatile SingularAttribute<ProductTag, Integer> id;

}
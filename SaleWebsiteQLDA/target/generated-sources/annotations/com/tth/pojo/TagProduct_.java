package com.tth.pojo;

import com.tth.pojo.Product;
import com.tth.pojo.Tag;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2024-09-06T13:01:15")
@StaticMetamodel(TagProduct.class)
public class TagProduct_ { 

    public static volatile SingularAttribute<TagProduct, Product> productId;
    public static volatile SingularAttribute<TagProduct, Tag> tagId;
    public static volatile SingularAttribute<TagProduct, Integer> id;

}
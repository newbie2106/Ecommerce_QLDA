package com.tth.pojo;

import com.tth.pojo.Brand;
import com.tth.pojo.Category;
import com.tth.pojo.Comment;
import com.tth.pojo.Image;
import com.tth.pojo.OrderDetail;
import com.tth.pojo.ProductTag;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-09-20T15:06:32")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SetAttribute<Product, ProductTag> productTagSet;
    public static volatile SingularAttribute<Product, Date> createdDate;
    public static volatile SetAttribute<Product, Image> imageSet;
    public static volatile SetAttribute<Product, Comment> commentSet;
    public static volatile SingularAttribute<Product, Long> price;
    public static volatile SingularAttribute<Product, Brand> brandId;
    public static volatile SingularAttribute<Product, String> name;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile SingularAttribute<Product, Integer> id;
    public static volatile SetAttribute<Product, OrderDetail> orderDetailSet;
    public static volatile SingularAttribute<Product, Category> categoryId;

}
package com.tth.pojo;

import com.tth.pojo.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-09-18T22:01:57")
@StaticMetamodel(Brand.class)
public class Brand_ { 

    public static volatile SingularAttribute<Brand, String> name;
    public static volatile SingularAttribute<Brand, String> logo;
    public static volatile SingularAttribute<Brand, Integer> id;
    public static volatile SetAttribute<Brand, Product> productSet;

}
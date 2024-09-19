package com.tth.pojo;

import com.tth.pojo.ProductTag;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-09-19T08:50:55")
@StaticMetamodel(Tag.class)
public class Tag_ { 

    public static volatile SetAttribute<Tag, ProductTag> productTagSet;
    public static volatile SingularAttribute<Tag, String> name;
    public static volatile SingularAttribute<Tag, Integer> id;

}
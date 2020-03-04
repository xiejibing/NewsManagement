package com.xie.enums;

public enum NewsTypeName {
    COMPANY_NEWS(0,"公司新闻"),
    INDUSTRY_NEWS(1,"行业新闻"),
    ;

    private int type;

    private String info;

    public static NewsTypeName stateof(int index){
        for(NewsTypeName state:values()){
            if(state.getType()==index)
                return state;
        }
        return null;
    }

    @Override
    public String toString() {
        return "NewTypeEnums{" +
                "type=" + type +
                ", info='" + info + '\'' +
                '}';
    }

    public int getType() {
        return type;
    }

    public String getInfo() {
        return info;
    }

    NewsTypeName() {
    }

    NewsTypeName(int type, String info) {
        this.type = type;
        this.info = info;
    }
}

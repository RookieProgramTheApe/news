package cn.news.domain;

/**
 * @author：niehong
 * @date：2020/12/3
 * @version：1.0
 */
public class NewsType {
    private String id;
    private String newsType;

    public NewsType() {

    }

    public NewsType(String id, String newsType) {
        this.id = id;
        this.newsType = newsType;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNewsType() {
        return newsType;
    }

    public void setNewsType(String newsType) {
        this.newsType = newsType;
    }

    @Override
    public String toString() {
        return "NewsType{" +
                "id='" + id + '\'' +
                ", newsType='" + newsType + '\'' +
                '}';
    }
}

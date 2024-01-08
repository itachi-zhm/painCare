package beans;

import java.util.Date;

public class painBean {
    private Integer id;
    private Integer level;

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    private String location;
    private String symptoms;
    private String painWorse;
    private String feeling;
    private Integer id_user;
    private Date created_at;

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public void setPainWorse(String painWorse) {
        this.painWorse = painWorse;
    }

    public void setFeeling(String feeling) {
        this.feeling = feeling;
    }

    public void setId_user(Integer id_user) {
        this.id_user = id_user;
    }

    public Integer getId() {
        return id;
    }

    public String getLocation() {
        return location;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public String getPainWorse() {
        return painWorse;
    }

    public String getFeeling() {
        return feeling;
    }

    public Integer getId_user() {
        return id_user;
    }
}

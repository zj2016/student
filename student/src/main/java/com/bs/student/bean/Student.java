package com.bs.student.bean;

public class Student {
    private Integer id;

    private String stuId;

    private String stuName;

    private String majoy;

    private String clazz;
    
    private Integer sumScore;
    
    private Integer numDeduct;
    
    private Float sumSd;
    
    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId == null ? null : stuId.trim();
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getMajoy() {
        return majoy;
    }

    public void setMajoy(String majoy) {
        this.majoy = majoy == null ? null : majoy.trim();
    }

	public String getClazz() {
		return clazz;
	}

	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	public Integer getSumScore() {
		return sumScore;
	}

	public void setSumScore(Integer sumScore) {
		this.sumScore = sumScore;
	}

	public Integer getNumDeduct() {
		return numDeduct;
	}

	public void setNumDeduct(Integer numDeduct) {
		this.numDeduct = numDeduct;
	}

	public Float getSumSd() {
		return sumSd;
	}

	public void setSumSd(Float sumSd) {
		this.sumSd = sumSd;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
    
}
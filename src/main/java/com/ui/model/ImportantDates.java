package com.ui.model;

public class ImportantDates {

	// Constructor with all fields
	public ImportantDates(int importantDateId, int festivalId, String englishDate, String englishDay, int samvatId,
			int hinduYearId, int hinduMonthId, int hinduPakshId, int tithiNumber, int hinduTithiId,
			int hinduMonthTypeId, String impDateDescription, String status, int createdBy, String createdDate,
			String ipAddress, String festivalName, String samvatName, String hinduYear, String hinduMonthName,
			String pakshName, String tithiName, String hinduMonthType) {
		this.importantDateId = importantDateId;
		this.festivalId = festivalId;
		this.englishDate = englishDate;
		this.englishDay = englishDay;
		this.samvatId = samvatId;
		this.hinduYearId = hinduYearId;
		this.hinduMonthId = hinduMonthId;
		this.hinduPakshId = hinduPakshId;
		this.tithiNumber = tithiNumber;
		this.hinduTithiId = hinduTithiId;
		this.hinduMonthTypeId = hinduMonthTypeId;
		this.impDateDescription = impDateDescription;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.ipAddress = ipAddress;
		this.festivalName = festivalName;
		this.samvatName = samvatName;
		this.hinduYear = hinduYear;
		this.hinduMonthName = hinduMonthName;
		this.pakshName = pakshName;
		this.tithiName = tithiName;
		this.hinduMonthType = hinduMonthType;

	}

	// Properties
	private int importantDateId;
	private int festivalId;
	private String englishDate;
	private String englishDay;
	private int samvatId;
	private int hinduYearId;
	private int hinduMonthId;
	private int hinduPakshId;
	private int hinduTithiId;
	private int tithiNumber;
	private int hinduMonthTypeId;
	private String impDateDescription;
	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;
	private String festivalName;
	private String samvatName;
	private String hinduYear;
	private String hinduMonthName;
	private String pakshName;
	private String tithiName;
	private String hinduMonthType;

	// Getters and Setters
	public int getImportantDateId() {
		return importantDateId;
	}

	public void setImportantDateId(int importantDateId) {
		this.importantDateId = importantDateId;
	}

	public int getFestivalId() {
		return festivalId;
	}

	public void setFestivalId(int festivalId) {
		this.festivalId = festivalId;
	}

	public String getEnglishDate() {
		return englishDate;
	}

	public void setEnglishDate(String englishDate) {
		this.englishDate = englishDate;
	}

	public int getSamvatId() {
		return samvatId;
	}

	public void setSamvatId(int samvatId) {
		this.samvatId = samvatId;
	}

	public int getHinduYearId() {
		return hinduYearId;
	}

	public void setHinduYearId(int hinduYearId) {
		this.hinduYearId = hinduYearId;
	}

	public int getHinduMonthId() {
		return hinduMonthId;
	}

	public void setHinduMonthId(int hinduMonthId) {
		this.hinduMonthId = hinduMonthId;
	}

	public int getHinduPakshId() {
		return hinduPakshId;
	}

	public void setHinduPakshId(int hinduPakshId) {
		this.hinduPakshId = hinduPakshId;
	}

	public int getHinduTithiId() {
		return hinduTithiId;
	}

	public void setHinduTithiId(int hinduTithiId) {
		this.hinduTithiId = hinduTithiId;
	}

	public int getHinduMonthTypeId() {
		return hinduMonthTypeId;
	}

	public void setHinduMonthTypeId(int hinduMonthTypeId) {
		this.hinduMonthTypeId = hinduMonthTypeId;
	}

	public String getImpDateDescription() {
		return impDateDescription;
	}

	public void setImpDateDescription(String impDateDescription) {
		this.impDateDescription = impDateDescription;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getFestivalName() {
		return festivalName;
	}

	public String getSamvatName() {
		return samvatName;
	}

	public String getHinduYear() {
		return hinduYear;
	}

	public String getHinduMonthName() {
		return hinduMonthName;
	}

	public String getPakshName() {
		return pakshName;
	}

	public String getTithiName() {
		return tithiName;
	}

	public String getHinduMonthType() {
		return hinduMonthType;
	}

	public void setFestivalName(String festivalName) {
		this.festivalName = festivalName;
	}

	public void setSamvatName(String samvatName) {
		this.samvatName = samvatName;
	}

	public void setHinduYear(String hinduYear) {
		this.hinduYear = hinduYear;
	}

	public void setHinduMonthName(String hinduMonthName) {
		this.hinduMonthName = hinduMonthName;
	}

	public void setPakshName(String pakshName) {
		this.pakshName = pakshName;
	}

	public void setTithiName(String tithiName) {
		this.tithiName = tithiName;
	}

	public void setHinduMonthType(String hinduMonthType) {
		this.hinduMonthType = hinduMonthType;
	}

	public String getEnglishDay() {
		return englishDay;
	}

	public void setEnglishDay(String englishDay) {
		this.englishDay = englishDay;
	}

	public int getTithiNumber() {
		return tithiNumber;
	}

	public void setTithiNumber(int tithiNumber) {
		this.tithiNumber = tithiNumber;
	}

}

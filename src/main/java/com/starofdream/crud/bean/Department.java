package com.starofdream.crud.bean;

public class Department {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_dept.dept_id
     *
     * @mbg.generated Sun Oct 27 16:13:25 CST 2019
     */
    private Integer deptId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_dept.dept_name
     *
     * @mbg.generated Sun Oct 27 16:13:25 CST 2019
     */
    private String deptName;

    
    /**
	 * 
	 */
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	/**
	 * @param deptId
	 * @param deptName
	 */
	public Department(Integer deptId, String deptName) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
	}


	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_dept.dept_id
     *
     * @return the value of tbl_dept.dept_id
     *
     * @mbg.generated Sun Oct 27 16:13:25 CST 2019
     */
    public Integer getDeptId() {
        return deptId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_dept.dept_id
     *
     * @param deptId the value for tbl_dept.dept_id
     *
     * @mbg.generated Sun Oct 27 16:13:25 CST 2019
     */
    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_dept.dept_name
     *
     * @return the value of tbl_dept.dept_name
     *
     * @mbg.generated Sun Oct 27 16:13:25 CST 2019
     */
    public String getDeptName() {
        return deptName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_dept.dept_name
     *
     * @param deptName the value for tbl_dept.dept_name
     *
     * @mbg.generated Sun Oct 27 16:13:25 CST 2019
     */
    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }
}
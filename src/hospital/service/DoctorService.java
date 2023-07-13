package hospital.service;

import hospital.dao.impl.DepartmentDaoimpl;
import hospital.dao.impl.DoctorDaoImpl;
import hospital.dao.impl.HospitalDaoImpl;
import hospital.dao.impl.SickDaoImpl;
import hospital.user.Doctor;
import hospital.user.Sick;

import java.util.List;
import java.util.Objects;

/**
 * @author Administrator
 * 医生服务
 * --登录
 * --注册(可随意注册,没有什么信息是唯一的)
 * --显示自身信息
 * --修改自身信息
 * --显示相同科室的病人数据
 * --删除病人数据
 * --修改病人数据
 */
public class DoctorService {
    DoctorDaoImpl doctorDao=new DoctorDaoImpl();
    SickDaoImpl sickDao=new SickDaoImpl();

    public Doctor DoctorLogin(String phone,String password){
        Doctor doctor=doctorDao.find(phone);
        if(doctor==null){
            return null;
        }
        if(!Objects.equals(doctor.getPassword(), password)){
            return null;
        }
        return doctor;
    }

    public Doctor DoctorRegister(String name, int HospitalId, int DepartmentId, String password,String sex,int age,
                                 String phone, String part, String part2, String part3, String discript){
        Doctor doctor=new Doctor();
        doctor.setName(name);
        doctor.setHospitalid(HospitalId);
        doctor.setDepartmentid(DepartmentId);
        doctor.setPassword(password);
        doctor.setSex(sex);
        doctor.setAge(age);
        doctor.setPhone(phone);
        doctor.setPart(part);
        doctor.setPart2(part2);
        doctor.setPart3(part3);
        doctor.setDiscript(discript);
        return doctorDao.add(doctor);
    }

    /**
     * 显示自身信息
     *           注册界面则由传入的doctor.getId()获取
     * @return 返回医生信息
     */
   public Doctor DoctorShow(int id){
        return doctorDao.findByid(id);
    }

    public boolean DoctorUpdate(int id, String name, int HospitalId, int DepartmentId, int age,String sex,String phone,String Hospital,String Department,String ProfessionalTitle, String Introduction){
        Doctor doctor=doctorDao.findByid(id);
        if(doctor==null){
            return false;
        }
        doctor.setName(name);
        doctor.setHospitalid(HospitalId);
        doctor.setDepartmentid(DepartmentId);
        doctor.setAge(age);
        doctor.setSex(sex);
        doctor.setPhone(phone);
        doctor.setPart(Hospital);
        doctor.setPart2(Department);
        doctor.setPart3(ProfessionalTitle);
        doctor.setDiscript(Introduction);
        return doctorDao.update(doctor);
    }

    /**
     * 显示相同科室的病人数据
     * @return 返回该科室的病人数据
     */
    public List<Sick> SickShow(int id){
        return sickDao.findAll(id);
    }

    public boolean SickDelete(int id){
        Sick sick=sickDao.findById(id);
        if(sick==null){
            return false;
        }
        return sickDao.delete(id);
    }
    /**
     * 更新挂号信息
     * @param id 根据id查找更新
     * @return 返回是否更新成功
     */
    public boolean SickUpdate(int id,String P_Name,String D_Name,String AppointmentDate,String AppointmentTime,String HospitalName,String DepartmentName){
        Sick s=sickDao.findById(id);
        if(s==null){
            return false;
        }
        s.setP_name(P_Name);
        s.setD_name(D_Name);
        s.setData(AppointmentDate);
        s.setTime(AppointmentTime);
        s.setHospitalname(HospitalName);
        s.setDepartmentname(DepartmentName);
        return sickDao.update(s);
    }
    public Sick SickFindById(int id){
        return sickDao.findById(id);
    }
}

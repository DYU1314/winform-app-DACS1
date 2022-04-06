using QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE.DAO;
using QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE
{
    public partial class frmMain : Form
    {
        public static string TenTaiKhoan = "";
        private string UserName = string.Empty;

        public frmMain()
        {
            InitializeComponent();
            LoadForm();
        }

        #region MeThods

        private void LoadForm()
        {
            mngQLDSV.Visible = false;
            tmgDangXuat.Visible = false;
            btntmgThoat.Visible = false;
            LoadQuyen();
        }

        private void LoadQuyen()
        {
            if (UserName != "")
            {
                TaiKhoan user = TaiKhoanDAO.Instance.GetTaiKhoanByTenTaiKhoan(UserName);
                if (user.Idquyen < 0 && user.Idquyen > 4)
                {
                    tmgQuanLy.Visible = false;
                    Application.Exit();
                }
                else
                {
                    if (user.Tenhienthi != "")
                    {
                        tmgTenHienThi.Text = user.Tenhienthi;
                    }
                    else
                    {
                        tmgTenHienThi.Text = "Thông tin";
                    }

                    if (user.Idquyen == 2)
                    {
                        tmgQuanLy.Visible = false;
                        tmgSinhVien.Visible = false;
                        tmgTaiKhoan.Visible = true;
                    }
                    else
                    {
                        if (user.Idquyen == 3)
                        {
                            tmgQuanLy.Visible = true;
                            tmgSinhVien.Visible = true;
                            tmgTaiKhoan.Visible = true;
                        }
                        else
                        {
                            if (user.Idquyen == 4)
                            {
                                tmgQuanLy.Visible = false;
                                tmgSinhVien.Visible = true;
                                tmgTaiKhoan.Visible = true;
                            }
                        }
                    }
                    mngQLDSV.Visible = true;
                    tmgDangXuat.Visible = true;
                    btntmgThoat.Visible = true;
                }
            }
        }

        private bool DangNhap(string userName, string passWord)
        {
            return TaiKhoanDAO.Instance.DangNhap(userName, passWord);
        }

        #endregion Methods

        #region Event

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            string userName = txtTenTaiKhoan.Text;
            string passWord = txtMatKhau.Text;

            if (userName == "" || passWord == "")
            {
                MessageBox.Show("Tài khoản hoặc mật khẩu trống!!!\nVui lòng kiểm tra lại", "Lỗi đăng nhập", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtTenTaiKhoan.Clear();
                txtMatKhau.Clear();
                txtTenTaiKhoan.Focus();
            }
            else
            {
                if (DangNhap(userName, passWord))
                {
                    TaiKhoan user = TaiKhoanDAO.Instance.GetTaiKhoanByTenTaiKhoan(userName);
                    TenTaiKhoan = user.Tentaikhoan;
                    UserName = user.Tentaikhoan;
                    pnlLogin.Visible = false;
                    mngQLDSV.Visible = true;
                    tmgDangXuat.Visible = true;
                    btntmgThoat.Visible = true;
                    if (user.Idquyen < 0 && user.Idquyen > 4)
                    {
                        tmgQuanLy.Visible = false;
                        Application.Exit();
                    }
                    else
                    {
                        if (user.Tenhienthi != "")
                        {
                            tmgTenHienThi.Text = user.Tenhienthi;
                        }
                        else
                        {
                            tmgTenHienThi.Text = "Thông tin";
                        }

                        if (user.Idquyen == 1)
                        {
                            tmgQuanLy.Visible = true;
                            tmgSinhVien.Visible = true;
                            tmgTaiKhoan.Visible = true;
                        }
                        else
                        {
                            if (user.Idquyen == 2)
                            {
                                tmgQuanLy.Visible = false;
                                tmgSinhVien.Visible = false;
                                tmgTaiKhoan.Visible = true;
                            }
                            else
                            {
                                if (user.Idquyen == 3)
                                {
                                    tmgQuanLy.Visible = true;
                                    tmgSinhVien.Visible = true;
                                    tmgTaiKhoan.Visible = true;
                                }
                                else
                                {
                                    if (user.Idquyen == 4)
                                    {
                                        tmgQuanLy.Visible = false;
                                        tmgSinhVien.Visible = true;
                                        tmgTaiKhoan.Visible = true;
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Sai tên tài khoản hoặc mật khẩu!!!\nVui lòng kiểm tra lại", "Lỗi đăng nhập", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtTenTaiKhoan.Clear();
                    txtMatKhau.Clear();
                    txtTenTaiKhoan.Focus();
                }
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn muốn thoát khỏi chương trình???", "thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                return;
            }
            else
            {
                Application.Exit();
            }
        }

        private void tmgDangXuat_Click(object sender, EventArgs e)
        {
            TenTaiKhoan = "";
            UserName = "";
            LoadForm();
            pnlLogin.Visible = true;
            txtMatKhau.Clear();
            txtTenTaiKhoan.Focus();
            TenTaiKhoan = "";
        }

        private void tmgTenHienThi_Click(object sender, EventArgs e)
        {
            frmTaiKhoan f = new frmTaiKhoan();
            mngQLDSV.Enabled = false;
            f.ShowDialog();
            LoadForm();
            mngQLDSV.Enabled = true;
        }

        private void tmgQuanLy_Click(object sender, EventArgs e)
        {
            frmQuanLy f = new frmQuanLy();
            mngQLDSV.Enabled = false;
            f.ShowDialog();
            mngQLDSV.Enabled = true;
        }

        private void lblThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn muốn thoát khỏi chương trình???", "thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                return;
            }
            else
            {
                Application.Exit();
            }
        }

        private void btntmgThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn muốn thoát khỏi chương trình???", "thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                return;
            }
            else
            {
                Application.Exit();
            }
        }

        private void pnlLogin_ParentChanged(object sender, EventArgs e)
        {
            if (pnlLogin.Visible == false)
            {
                this.CancelButton = btntmgThoat;
                return;
            }
            else
            {
                this.CancelButton = btnThoat;
            }
        }

        #endregion Event

        private void tmgSinhVien_Click(object sender, EventArgs e)
        {
            frmQuanLyDiem f = new frmQuanLyDiem();
            mngQLDSV.Enabled = false;
            f.ShowDialog();
            mngQLDSV.Enabled = true;
        }
    }
}

namespace QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE
{
    partial class frmReport
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource2 = new Microsoft.Reporting.WinForms.ReportDataSource();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource3 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.USP_LoadDanhSachSinhVienReportBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.db_QLDSVKKTCNDataSet = new QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE.db_QLDSVKKTCNDataSet();
            this.USP_DanhSachSinhVienVaDiemHocPhanReportBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.ReportNe = new Microsoft.Reporting.WinForms.ReportViewer();
            this.USP_LoadDanhSachSinhVienReportTableAdapter = new QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE.db_QLDSVKKTCNDataSetTableAdapters.USP_LoadDanhSachSinhVienReportTableAdapter();
            this.USP_DanhSachSinhVienVaDiemHocPhanReportTableAdapter = new QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE.db_QLDSVKKTCNDataSetTableAdapters.USP_DanhSachSinhVienVaDiemHocPhanReportTableAdapter();
            this.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopTableAdapter = new QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE.db_QLDSVKKTCNDataSetTableAdapters.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopTableAdapter();
            this.ReportDay = new Microsoft.Reporting.WinForms.ReportViewer();
            this.ReportNuaNe = new Microsoft.Reporting.WinForms.ReportViewer();
            ((System.ComponentModel.ISupportInitialize)(this.USP_LoadDanhSachSinhVienReportBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.db_QLDSVKKTCNDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.USP_DanhSachSinhVienVaDiemHocPhanReportBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // USP_LoadDanhSachSinhVienReportBindingSource
            // 
            this.USP_LoadDanhSachSinhVienReportBindingSource.DataMember = "USP_LoadDanhSachSinhVienReport";
            this.USP_LoadDanhSachSinhVienReportBindingSource.DataSource = this.db_QLDSVKKTCNDataSet;
            // 
            // db_QLDSVKKTCNDataSet
            // 
            this.db_QLDSVKKTCNDataSet.DataSetName = "db_QLDSVKKTCNDataSet";
            this.db_QLDSVKKTCNDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // USP_DanhSachSinhVienVaDiemHocPhanReportBindingSource
            // 
            this.USP_DanhSachSinhVienVaDiemHocPhanReportBindingSource.DataMember = "USP_DanhSachSinhVienVaDiemHocPhanReport";
            this.USP_DanhSachSinhVienVaDiemHocPhanReportBindingSource.DataSource = this.db_QLDSVKKTCNDataSet;
            // 
            // USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopBindingSource
            // 
            this.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopBindingSource.DataMember = "USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLop";
            this.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopBindingSource.DataSource = this.db_QLDSVKKTCNDataSet;
            // 
            // ReportNe
            // 
            this.ReportNe.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            reportDataSource1.Name = "DataSet1";
            reportDataSource1.Value = this.USP_LoadDanhSachSinhVienReportBindingSource;
            this.ReportNe.LocalReport.DataSources.Add(reportDataSource1);
            this.ReportNe.LocalReport.ReportEmbeddedResource = "QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE.Report1.rdlc";
            this.ReportNe.Location = new System.Drawing.Point(130, 0);
            this.ReportNe.Name = "ReportNe";
            this.ReportNe.Size = new System.Drawing.Size(1058, 815);
            this.ReportNe.TabIndex = 0;
            // 
            // USP_LoadDanhSachSinhVienReportTableAdapter
            // 
            this.USP_LoadDanhSachSinhVienReportTableAdapter.ClearBeforeFill = true;
            // 
            // USP_DanhSachSinhVienVaDiemHocPhanReportTableAdapter
            // 
            this.USP_DanhSachSinhVienVaDiemHocPhanReportTableAdapter.ClearBeforeFill = true;
            // 
            // USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopTableAdapter
            // 
            this.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopTableAdapter.ClearBeforeFill = true;
            // 
            // ReportDay
            // 
            this.ReportDay.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            reportDataSource2.Name = "DataSet1";
            reportDataSource2.Value = this.USP_DanhSachSinhVienVaDiemHocPhanReportBindingSource;
            this.ReportDay.LocalReport.DataSources.Add(reportDataSource2);
            this.ReportDay.LocalReport.ReportEmbeddedResource = "QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE.Report2.rdlc";
            this.ReportDay.Location = new System.Drawing.Point(130, 0);
            this.ReportDay.Name = "ReportDay";
            this.ReportDay.Size = new System.Drawing.Size(1058, 815);
            this.ReportDay.TabIndex = 1;
            // 
            // ReportNuaNe
            // 
            this.ReportNuaNe.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            reportDataSource3.Name = "DataSet1";
            reportDataSource3.Value = this.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopBindingSource;
            this.ReportNuaNe.LocalReport.DataSources.Add(reportDataSource3);
            this.ReportNuaNe.LocalReport.ReportEmbeddedResource = "QUAN_LY_DIEM_SINH_VIEN_KHOA_KY_THUAT_CONG_NGHE.Report3.rdlc";
            this.ReportNuaNe.Location = new System.Drawing.Point(130, 0);
            this.ReportNuaNe.Name = "ReportNuaNe";
            this.ReportNuaNe.Size = new System.Drawing.Size(1058, 815);
            this.ReportNuaNe.TabIndex = 2;
            // 
            // frmReport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(236)))), ((int)(((byte)(240)))), ((int)(((byte)(241)))));
            this.ClientSize = new System.Drawing.Size(1327, 815);
            this.Controls.Add(this.ReportNuaNe);
            this.Controls.Add(this.ReportNe);
            this.Controls.Add(this.ReportDay);
            this.Name = "frmReport";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmReport_Load);
            ((System.ComponentModel.ISupportInitialize)(this.USP_LoadDanhSachSinhVienReportBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.db_QLDSVKKTCNDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.USP_DanhSachSinhVienVaDiemHocPhanReportBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer ReportNe;
        private System.Windows.Forms.BindingSource USP_LoadDanhSachSinhVienReportBindingSource;
        private db_QLDSVKKTCNDataSet db_QLDSVKKTCNDataSet;
        private db_QLDSVKKTCNDataSetTableAdapters.USP_LoadDanhSachSinhVienReportTableAdapter USP_LoadDanhSachSinhVienReportTableAdapter;
        private System.Windows.Forms.BindingSource USP_DanhSachSinhVienVaDiemHocPhanReportBindingSource;
        private db_QLDSVKKTCNDataSetTableAdapters.USP_DanhSachSinhVienVaDiemHocPhanReportTableAdapter USP_DanhSachSinhVienVaDiemHocPhanReportTableAdapter;
        private System.Windows.Forms.BindingSource USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopBindingSource;
        private db_QLDSVKKTCNDataSetTableAdapters.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopTableAdapter USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopTableAdapter;
        private Microsoft.Reporting.WinForms.ReportViewer ReportDay;
        private Microsoft.Reporting.WinForms.ReportViewer ReportNuaNe;
    }
}
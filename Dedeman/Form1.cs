using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Dedeman
{
    public partial class Form1 : Form
    {
        private SqlConnection cs = new SqlConnection(ConfigurationManager.ConnectionStrings["cn"].ConnectionString);
        private SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataSet ds1 = new DataSet();

        private int id;
        public Form1()
        {
            InitializeComponent();
        }

        private void tableLayoutPanel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {

        }
        private bool generatedBoxes=false;
        private void geneerateTextBoxes_Clicked(object sender, EventArgs e)
        {
            List<string> list = new List<string>(ConfigurationManager.AppSettings["ChildColumnName"].Split(','));
            int pointX=10,pointY=10;
            int i = 0;
            foreach(var l in list)
            {
                TextBox aTextBox=new TextBox();
                aTextBox.Width=300;
                aTextBox.Text=l;
                aTextBox.Name=l;
                aTextBox.Location = new Point(pointX, pointY);
                if(i==0)
                    aTextBox.Enabled=false;
                else
                    aTextBox.Visible = true;
                aTextBox.Parent = box_panel;
                pointY += 30;
                generatedBoxes = true;
                i++;
            }

        }

        private void connect_Click(object sender, EventArgs e)
        {
            try
            {
                da.SelectCommand = new SqlCommand(ConfigurationManager.AppSettings["selectParent"], cs);
                ds.Clear();
                da.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
 
            }
        }
        private string pFkid;

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            Console.WriteLine("s-a apasat", e.RowIndex);
            try
            {
                Console.WriteLine("s-a apasat", e.RowIndex);

                da.SelectCommand = new SqlCommand(ConfigurationManager.AppSettings["selectChild"], cs);
                pFkid = dataGridView1.SelectedRows[0].Cells[0].Value.ToString();
                Console.WriteLine(pFkid);
                da.SelectCommand.Parameters.Add("@pFkid", SqlDbType.VarChar).Value = pFkid;
                ds1.Clear();
                da.Fill(ds1);
                dataGridView2.DataSource = ds1.Tables[0];
                //dataGridView2.Columns["cod_prod"].Visible = false;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void DataGrid2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (!generatedBoxes) geneerateTextBoxes_Clicked(sender, e); // in case the generate boxes was not clicked to be actevated on child row selection
            if (string.IsNullOrEmpty(dataGridView2.CurrentRow.Cells[0].Value.ToString())) return;
            List<string> columns = new List<string>(ConfigurationManager.AppSettings["ChildColumnName"].Split(','));
            int i = 1;
            id = int.Parse(dataGridView2.CurrentRow.Cells[0].Value.ToString());
            Console.WriteLine(columns.ToString());
            Console.WriteLine("Suntem in grid 2.............");
            Console.WriteLine(id);
            foreach (var col in columns)
            {

                TextBox textBox = (TextBox)box_panel.Controls[col];
                textBox.Text= dataGridView2.CurrentRow.Cells[col].Value.ToString();
                Console.WriteLine(textBox.Text);
                if(i==0)
                i++;
            }
            Console.WriteLine("Iesit din grid 2.............");

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
        public static string GetParameterizedCommandText(SqlCommand command)
        {
            string commandText = command.CommandText;

            foreach (SqlParameter parameter in command.Parameters)
            {
                // Surround parameter name with single quotes if it's a string type
                string parameterValue = (parameter.SqlDbType == SqlDbType.NVarChar || parameter.SqlDbType == SqlDbType.VarChar) ?
                    $"'{parameter.Value.ToString()}'" :
                    parameter.Value.ToString();

                // Replace parameter placeholder with its value
                commandText = commandText.Replace(parameter.ParameterName, parameterValue);
            }

            return commandText;
        }

        private void insert_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection cs = new SqlConnection(ConfigurationManager.ConnectionStrings["cn"].ConnectionString);

                List<string> columns = new List<string>(ConfigurationManager.AppSettings["ChildColumnName"].Split(','));
                List<string> columnsTypes = new List<string>(ConfigurationManager.AppSettings["ChildParaTypes"].Split(','));
                foreach (var col in columns)
                {
                    TextBox textBox = (TextBox)box_panel.Controls[col];
                    if (string.IsNullOrEmpty(textBox.Text))
                    {
                        MessageBox.Show("Empty Fields");
                        return;
                    }
                }
                da.InsertCommand = new SqlCommand(ConfigurationManager.AppSettings["insertQuery"], cs);
                int i = 0;
                foreach (var col in columns)
                {
                    TextBox textBox = (TextBox)box_panel.Controls[col];
                    Console.WriteLine("------------");
                    Console.WriteLine(col);
                    Console.WriteLine(textBox.Text);
                    Console.WriteLine(columnsTypes[i]);
                    Console.WriteLine("--------------");

                    if (String.Compare(columnsTypes[i], "VarChar")==0){
                        da.InsertCommand.Parameters.Add("@"+col, SqlDbType.VarChar).Value = textBox.Text;
                    }
                    else
                    if (String.Compare(columnsTypes[i], "NVarChar") == 0)
                    {
                        da.InsertCommand.Parameters.Add("@" + col, SqlDbType.NVarChar).Value = textBox.Text;
                    }
                    else
                    if (String.Compare(columnsTypes[i], "Int") == 0)
                    {
                        da.InsertCommand.Parameters.Add("@" + col, SqlDbType.Int).Value = int.Parse(textBox.Text);
                    }
                    else
                    if (String.Compare(columnsTypes[i], "Float") == 0)
                    {
                        float new_textBox = (float)Math.Round(float.Parse(textBox.Text, CultureInfo.InvariantCulture), 2);
                        da.InsertCommand.Parameters.Add("@" + col, SqlDbType.Float).Value = new_textBox;
                    }
                    i++;
                }
                cs.Open();
                Console.WriteLine(GetParameterizedCommandText(da.InsertCommand));
                da.InsertCommand.ExecuteNonQuery();
                cs.Close();
                this.refresh();
                this.clearTextFields();
                MessageBox.Show("Insertion complete");

            }
            catch (Exception ex)
            {

                cs.Close();
                Console.WriteLine(ex.Message);
                MessageBox.Show("No insertion");
            }
        }

        private void refresh()
        {
            try
            {
                da.SelectCommand = new SqlCommand(ConfigurationManager.AppSettings["selectChild"], cs);
                pFkid = dataGridView1.SelectedRows[0].Cells[0].Value.ToString();
                Console.WriteLine(pFkid);
                da.SelectCommand.Parameters.Add("@pFkid", SqlDbType.VarChar).Value = pFkid;
                ds1.Clear();
                da.Fill(ds1);
                dataGridView2.DataSource = ds1.Tables[0];
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                cs.Close();
            }

        }
        private void clearTextFields() {
            List<string> columns = new List<string>(ConfigurationManager.AppSettings["ChildColumnName"].Split(','));
            foreach (var col in columns)
            {
                TextBox textBox = (TextBox)box_panel.Controls[col];
                textBox.Clear();
                textBox.Text = col;

            }
        }

        private void update_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection cs = new SqlConnection(ConfigurationManager.ConnectionStrings["cn"].ConnectionString);

                List<string> columns = new List<string>(ConfigurationManager.AppSettings["ChildColumnName"].Split(','));
                List<string> columnsTypes = new List<string>(ConfigurationManager.AppSettings["ChildParaTypes"].Split(','));
                foreach (var col in columns)
                {
                    TextBox textBox = (TextBox)box_panel.Controls[col];
                    if (string.IsNullOrEmpty(textBox.Text))
                    {
                        MessageBox.Show("Empty Fields");
                        return;
                    }
                }
                da.UpdateCommand = new SqlCommand(ConfigurationManager.AppSettings["UpdateQuery"], cs);
                int i = 0;
                foreach (var col in columns)
                {
                    TextBox textBox = (TextBox)box_panel.Controls[col];
                    Console.WriteLine("------------");
                    Console.WriteLine(col);
                    Console.WriteLine(textBox.Text);
                    Console.WriteLine(columnsTypes[i]);
                    Console.WriteLine("--------------");

                    if (String.Compare(columnsTypes[i], "VarChar") == 0)
                    {
                        da.UpdateCommand.Parameters.Add("@" + col, SqlDbType.VarChar).Value = textBox.Text;
                    }
                    else
                    if (String.Compare(columnsTypes[i], "NVarChar") == 0)
                    {
                        da.UpdateCommand.Parameters.Add("@" + col, SqlDbType.NVarChar).Value = textBox.Text;
                    }
                    else
                    if (String.Compare(columnsTypes[i], "Int") == 0)
                    {
                        da.UpdateCommand.Parameters.Add("@" + col, SqlDbType.Int).Value = int.Parse(textBox.Text);
                    }
                    else
                    if (String.Compare(columnsTypes[i], "Float") == 0)
                    {
                        float new_textBox = (float)Math.Round(float.Parse(textBox.Text, CultureInfo.InvariantCulture), 2);
                        da.UpdateCommand.Parameters.Add("@" + col, SqlDbType.Float).Value = new_textBox;
                    }
                    i++;
                }
                da.UpdateCommand.Parameters.AddWithValue("@childPK", id);

                cs.Open();
                    da.UpdateCommand.ExecuteNonQuery();
                    cs.Close();
                    MessageBox.Show("Update succesful");
                    this.refresh();
                this.clearTextFields();                
            }
            catch (Exception ex)
            {
                cs.Close();
                MessageBox.Show("no update");
                Console.WriteLine(ex.Message);

            }
        }

        private void deleteButton_Click(object sender, EventArgs e)
        {
            try
            {

               
                    da.DeleteCommand = new SqlCommand(ConfigurationManager.AppSettings["DeleteQuery"], cs);

                da.DeleteCommand.Parameters.AddWithValue("@childPK", id);


                cs.Open();
                    da.DeleteCommand.ExecuteNonQuery();
                cs.Close();
                MessageBox.Show("Delete succesful");
               this.refresh();
                this.clearTextFields();

                
            }
            catch (Exception ex)
            {
                cs.Close();
                MessageBox.Show("no delete");
                Console.WriteLine(ex.Message);

            }

        }


    }
}

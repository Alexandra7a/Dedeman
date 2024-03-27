using System;
using System.Collections.Generic;
using System.ComponentModel;
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
        private SqlConnection cs = new SqlConnection("Data Source=DESKTOP-E7Q8EGR\\SQLEXPRESS;" +
"initial Catalog=Dedeman;Integrated Security=True");
        private SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataSet ds1 = new DataSet();



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

        private void connect_Click(object sender, EventArgs e)
        {
            try
            {
                da.SelectCommand = new SqlCommand("SELECT * FROM Categorii", cs);
                ds.Clear();
                da.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
       
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
 
            }
        }
        private string cat;

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            Console.WriteLine("s-a apasat", e.RowIndex);
            try
            {
                dataGridView1.BackgroundColor = SystemColors.ControlDark;
                Console.WriteLine("s-a apasat", e.RowIndex);

                Console.WriteLine("s-a apasat", e.RowIndex);
                da.SelectCommand = new SqlCommand(" select cod_prod, nume, pret, cantitate,descriere,cod_magazin from Produse where categorie=@categorie", cs);
                cat = dataGridView1.SelectedRows[0].Cells[0].Value.ToString();
                da.SelectCommand.Parameters.Add("@categorie", SqlDbType.VarChar).Value = cat;
                ds1.Clear();
                da.Fill(ds1);

                dataGridView2.DataSource = ds1.Tables[0];
                dataGridView2.Columns["cod_prod"].Visible = false;
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
            nume.Text = dataGridView2.SelectedRows[0].Cells["nume"].Value.ToString();
            pret.Text = dataGridView2.SelectedRows[0].Cells["pret"].Value.ToString();
            cantitate.Text = dataGridView2.SelectedRows[0].Cells["cantitate"].Value.ToString();
            magazin.Text = dataGridView2.SelectedRows[0].Cells["cod_magazin"].Value.ToString();
            descriere.Text = dataGridView2.SelectedRows[0].Cells["descriere"].Value.ToString();
            //int cod = int.Parse(dataGridView2.SelectedRows[0].Cells[0].Value.ToString());

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void insert_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(nume.Text) && !string.IsNullOrEmpty(cantitate.Text) &&
            !string.IsNullOrEmpty(pret.Text) && !string.IsNullOrEmpty(magazin.Text) && !string.IsNullOrEmpty(descriere.Text))
                {
                    da.InsertCommand = new SqlCommand
                    ("INSERT INTO Produse Values (@nume, @categorie,@pret, @cantitate,@cod_magazin,@descriere);", cs);

                    float pret_nou = (float)Math.Round(float.Parse(pret.Text, CultureInfo.InvariantCulture), 2);


                    da.InsertCommand = new SqlCommand("INSERT INTO Produse (nume, categorie, pret, cantitate, cod_magazin, descriere) VALUES (@nume, @categorie, @pret, @cantitate, @cod_magazin, @descriere);", cs);
                    da.InsertCommand.Parameters.Add("@nume", SqlDbType.NVarChar).Value = nume.Text;
                    da.InsertCommand.Parameters.Add("@categorie", SqlDbType.VarChar).Value = cat;
                    da.InsertCommand.Parameters.Add("@pret", SqlDbType.Float).Value = pret_nou;
                    da.InsertCommand.Parameters.Add("@cantitate", SqlDbType.Int).Value = int.Parse(cantitate.Text);
                    da.InsertCommand.Parameters.Add("@cod_magazin", SqlDbType.Int).Value = int.Parse(magazin.Text);
                    da.InsertCommand.Parameters.Add("@descriere", SqlDbType.VarChar).Value = descriere.Text;
                    cs.Open();


                    da.InsertCommand.ExecuteNonQuery();
                    MessageBox.Show("Insertion complete");
                }
                else
                    MessageBox.Show("Empty Fields");
                cs.Close();


            }
            catch (Exception ex)
            {

                cs.Close();
                Console.WriteLine(ex.Message);
                MessageBox.Show("No insertion");
            }
        }

        private void refresh_Click(object sender, EventArgs e)
        {
            try
            {
                dataGridView1.BackgroundColor = SystemColors.ControlDark;

                da.SelectCommand = new SqlCommand(" select cod_prod, nume, pret, cantitate,descriere,cod_magazin from Produse where categorie=@categorie", cs);
                cat = dataGridView1.SelectedRows[0].Cells[0].Value.ToString();
                da.SelectCommand.Parameters.Add("@categorie", SqlDbType.VarChar).Value = cat;
                ds1.Clear();
                da.Fill(ds1);

                dataGridView2.DataSource = ds1.Tables[0];
                dataGridView2.Columns["cod_prod"].Visible = false;
                cs.Close();


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                cs.Close();
            }

        }

        private void update_Click(object sender, EventArgs e)
        {
            try
            {

                if (!string.IsNullOrEmpty(nume.Text) && !string.IsNullOrEmpty(cantitate.Text) &&
            !string.IsNullOrEmpty(pret.Text) && !string.IsNullOrEmpty(magazin.Text) && !string.IsNullOrEmpty(descriere.Text))
                {
                    da.UpdateCommand = new SqlCommand("Update Produse set " +
                        "nume=@nume, " +
                        "categorie=@categorie," +
                        " pret=@pret, " +
                        "cantitate=@cantitate" +
                        ",descriere=@descriere,cod_magazin=@cod_magazin" +
                        "where cod_prod=@cod_prod", cs);

                    da.InsertCommand.Parameters.Add("@nume", SqlDbType.NVarChar).Value = nume.Text;
                    da.InsertCommand.Parameters.Add("@categorie", SqlDbType.VarChar).Value = cat;
                    da.InsertCommand.Parameters.Add("@pret", SqlDbType.Float).Value = pret.Text;

                    da.InsertCommand.Parameters.Add("@cantitate", SqlDbType.Int).Value = int.Parse(cantitate.Text);
                    da.InsertCommand.Parameters.Add("@descriere", SqlDbType.VarChar).Value = descriere.Text;
                    da.InsertCommand.Parameters.Add("@cod_magazin", SqlDbType.Int).Value = int.Parse(magazin.Text);

                    da.InsertCommand.Parameters.Add("@cod_prod", SqlDbType.Int).Value = int.Parse(dataGridView2.SelectedRows[0].Cells[0].Value.ToString());


                    cs.Open();
                    da.UpdateCommand.ExecuteNonQuery();
                    MessageBox.Show("Update succesful");
                }
                cs.Close();
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

                if (!string.IsNullOrEmpty(nume.Text) && !string.IsNullOrEmpty(cantitate.Text) &&
            !string.IsNullOrEmpty(pret.Text) && !string.IsNullOrEmpty(magazin.Text) && !string.IsNullOrEmpty(descriere.Text))
                {
                    da.DeleteCommand = new SqlCommand("Delete from Produse" +
                        "where cod_prod=@cod_prod", cs);

                    da.DeleteCommand.Parameters.Add("@cod_prod", SqlDbType.Int).Value = int.Parse(dataGridView2.SelectedRows[0].Cells[0].Value.ToString());

                    cs.Open();
                    da.DeleteCommand.ExecuteNonQuery();
                    MessageBox.Show("Update succesful");
                }
                cs.Close();
            }
            catch (Exception ex)
            {
                cs.Close();
                MessageBox.Show("no update");
                Console.WriteLine(ex.Message);

            }

        }
    }
}

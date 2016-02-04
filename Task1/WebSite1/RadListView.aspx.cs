using System;
using System.Collections.Generic;
using System.Linq;
using Telerik.Web.UI;

public partial class RadListView : System.Web.UI.Page
{
    /// <summary>
    /// Element of list datasource
    /// </summary>
    class ListItem
    {
        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }
    }

    /// <summary>
    /// List datasource
    /// </summary>
    List<ListItem> ListDataSource
    {
        get
        {
            return (List<ListItem>)Session["ListDataSource"];
        }

        set { Session["ListDataSource"] = value; }
    }

    /// <summary>
    /// Page_Load handler
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ListDataSource = new List<ListItem>();
            for (int i = 1; i < 10; i++)
            {
                ListDataSource.Add(new ListItem { Id = i });
            }
        }

        LabelRadListView1SelectedValue.Text = RadListView1.SelectedValue != null ? RadListView1.SelectedValue.ToString() : String.Empty;
    }

    /// <summary>
    /// NeedDataSource handler
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void RadListView1_OnNeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e)
    {
        RadListView1.DataSource = ListDataSource;
    }

	protected void RadListView1_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		LabelRadListView1SelectedValue.Text = RadListView1.SelectedValue != null ? RadListView1.SelectedValue.ToString() : String.Empty;
	}
}
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
    /// Grid datasource
    /// </summary>
    List<int> GridDataSource
    {
        get
        {
            return (List<int>)Session["GridDataSource"];
        }

        set { Session["GridDataSource"] = value; }
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

            GridDataSource = new List<int>();
            for (int i = 11; i < 100; i++)
            {
                GridDataSource.Add(i);
            }
        }
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

    /// <summary>
    /// NeedDataSource handler
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void RadGrid1_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
		var page = ((int)(RadListView1.SelectedValue ?? 0) == 1) ? 9 : 10;
		var selected = (int)(RadListView1.SelectedValue ?? 1) - 1;
		RadGrid1.DataSource = GridDataSource.Skip(page * selected - ((page > 9) ? 1 : 0)).Take(page);
    }

	protected void RadListView1_OnSelectedIndexChanged(object sender, EventArgs e)
	{
//		RadGrid1.CurrentPageIndex = ((int) RadListView1.SelectedValue) - 1;
//		RadGrid1.PageSize = ((int) RadListView1.SelectedValue == 1) ? 9 : 10;
		RadGrid1.Rebind();
	}
}
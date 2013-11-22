using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using linh.controls;
using linh.core.dal;
using linh.core;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
namespace docsoft.entities
{

    #region Tags
    #region BO
    public class Tags : BaseEntity
    {
        #region Properties
        public Guid ID { get; set; }
        public String Ten { get; set; }
        public Int32 SoLuong { get; set; }
        #endregion
        #region Contructor
        public Tags()
        { }
        #endregion
        #region Customs properties

        #endregion
        public override BaseEntity getFromReader(IDataReader rd)
        {
            return TagsDal.getFromReader(rd);
        }
    }
    #endregion
    #region Collection
    public class TagsCollection : BaseEntityCollection<Tags>
    { }
    #endregion
    #region Dal
    public class TagsDal
    {
        #region Methods

        public static void DeleteById(Guid TAG_ID)
        {
            var obj = new SqlParameter[1];
            obj[0] = new SqlParameter("TAG_ID", TAG_ID);
            SqlHelper.ExecuteNonQuery(DAL.con(), CommandType.StoredProcedure, "sp_tblTags_Delete_DeleteById_linhnx", obj);
        }

        public static Tags Insert(Tags item)
        {
            var Item = new Tags();
            var obj = new SqlParameter[3];
            obj[0] = new SqlParameter("TAG_ID", item.ID);
            obj[1] = new SqlParameter("TAG_Ten", item.Ten);
            obj[2] = new SqlParameter("TAG_SoLuong", item.SoLuong);

            using (IDataReader rd = SqlHelper.ExecuteReader(DAL.con(), CommandType.StoredProcedure, "sp_tblTags_Insert_InsertNormal_linhnx", obj))
            {
                while (rd.Read())
                {
                    Item = getFromReader(rd);
                }
            }
            return Item;
        }

        public static Tags Update(Tags item)
        {
            var Item = new Tags();
            var obj = new SqlParameter[3];
            obj[0] = new SqlParameter("TAG_ID", item.ID);
            obj[1] = new SqlParameter("TAG_Ten", item.Ten);
            obj[2] = new SqlParameter("TAG_SoLuong", item.SoLuong);

            using (IDataReader rd = SqlHelper.ExecuteReader(DAL.con(), CommandType.StoredProcedure, "sp_tblTags_Update_UpdateNormal_linhnx", obj))
            {
                while (rd.Read())
                {
                    Item = getFromReader(rd);
                }
            }
            return Item;
        }

        public static Tags SelectById(Guid TAG_ID)
        {
            var Item = new Tags();
            var obj = new SqlParameter[1];
            obj[0] = new SqlParameter("TAG_ID", TAG_ID);
            using (IDataReader rd = SqlHelper.ExecuteReader(DAL.con(), CommandType.StoredProcedure, "sp_tblTags_Select_SelectById_linhnx", obj))
            {
                while (rd.Read())
                {
                    Item = getFromReader(rd);
                }
            }
            return Item;
        }

        public static TagsCollection SelectAll()
        {
            var List = new TagsCollection();
            using (IDataReader rd = SqlHelper.ExecuteReader(DAL.con(), CommandType.StoredProcedure, "sp_tblTags_Select_SelectAll_linhnx"))
            {
                while (rd.Read())
                {
                    List.Add(getFromReader(rd));
                }
            }
            return List;
        }
        public static Pager<Tags> pagerNormal(string url, bool rewrite, string sort, string q, int size)
        {
            var obj = new SqlParameter[2];
            obj[0] = new SqlParameter("Sort", sort);
            if (!string.IsNullOrEmpty(q))
            {
                obj[1] = new SqlParameter("q", q);
            }
            else
            {
                obj[1] = new SqlParameter("q", DBNull.Value);
            }

            var pg = new Pager<Tags>("sp_tblTags_Pager_Normal_linhnx", "page", size, 10, rewrite, url, obj);
            return pg;
        }
        #endregion

        #region Utilities
        public static Tags getFromReader(IDataReader rd)
        {
            var Item = new Tags();
            if (rd.FieldExists("TAG_ID"))
            {
                Item.ID = (Guid)(rd["TAG_ID"]);
            }
            if (rd.FieldExists("TAG_Ten"))
            {
                Item.Ten = (String)(rd["TAG_Ten"]);
            }
            if (rd.FieldExists("TAG_SoLuong"))
            {
                Item.SoLuong = (Int32)(rd["TAG_SoLuong"]);
            }
            return Item;
        }
        #endregion

        #region Extend
        public static TagsCollection SelectTop(SqlConnection con, int Top)
        {
            var List = new TagsCollection();
            var obj = new SqlParameter[2];
            obj[0] = new SqlParameter("Top", Top);
            using (IDataReader rd = SqlHelper.ExecuteReader(con, CommandType.StoredProcedure, "sp_tblTags_Select_SelectTop_linhnx", obj))
            {
                while (rd.Read())
                {
                    List.Add(getFromReader(rd));
                }
            }
            return List;
        }
        #endregion
    }
    #endregion

    #endregion
    
}



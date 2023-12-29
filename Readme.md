<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128534809/15.1.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4473)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->

# Grid for ASP.NET Web Forms - How to extend keyboard functionality

This example demonstrates how to extend keyboard functionality to allow users to edit, delete, or add new rows with a keyboard.

## Implementation Details

1. Handle the client-side `Init` event.

```aspx
<dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="False" DataSourceID="ads" KeyFieldName="CategoryID" ClientInstanceName="gridView" KeyboardSupport="True" AccessKey="T">
    <ClientSideEvents Init="OnInit" />
    ...
</dx:ASPxGridView>
```

2. Call the [ASPxClientUtils.AttachEventToElement](https://docs.devexpress.com/AspNet/js-ASPxClientUtils.AttachEventToElement.static(element-eventName-method)) method to attach the `KeyDown` event handler to the ASPxGridView html rendering. Use the `keyCode` property to determine the pressed key and call the corresponding grid method. For instance, call the [ASPxClientGridView.StartEditRow](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.StartEditRow(visibleIndex)) method when the F2 key is pressed.


> [!IMPORTANT]
> You can use the `KeyDown` event handler for elements that can get focus only. Set the [ASPxGridView.KeyboardSupport](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.KeyboardSupport) property to `true` to allow the ASPxGridView to use the keyboard.

```js
function OnInit(s, e) {  
    ASPxClientUtils.AttachEventToElement(  
        s.GetMainElement(),  
        "keydown",  
        function (evt) {  
            switch (evt.keyCode) {  
                //F2  
                case 113:  
                    var key = s.GetFocusedRowIndex();  
                    s.StartEditRow(key);  
                    break;  
                    ...  
            }  
        }  
    );  
}  
```

This example implements the following keys for CRUD operations:

* F2 - Edit the selected row.
* F3 - Insert a new row.
* Delete - Delete the selected row.
* Enter - Close Edit Form and save changes.
* Esc- Close Edit Form without saving.

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))

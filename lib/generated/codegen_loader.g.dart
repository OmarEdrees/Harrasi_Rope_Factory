// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> _ar = {
    "onboarding": {
      "welcome": {
        "title": "أهلاً بك",
        "description":
            "مرحباً بك في برنامجنا لإدارة المبيعات، التصنيع، الحسابات، الفواتير والمخازن."
      },
      "sales": {
        "title": "المبيعات",
        "description":
            "تسجيل العملاء، إنشاء عروض الأسعار، متابعة الطلبات، والتقارير اليومية والشهرية والسنوية."
      },
      "manufacturing": {
        "title": "التصنيع",
        "description":
            "إدارة أوامر التصنيع، تحديد المواد الخام، متابعة الإنتاج، وتقارير كفاءة العمال والآلات."
      },
      "accounting": {
        "title": "الحسابات",
        "description":
            "تسجيل الإيرادات والمصروفات، إدارة الحسابات البنكية والكاش، كشف حساب العملاء والموردين، والتقارير المالية."
      },
      "invoices": {
        "title": "الفواتير",
        "description":
            "فواتير المبيعات والمشتريات والصيانة والتصنيع، دفع وتحصيل الفواتير، وأرشيف قابل للبحث والطباعة."
      },
      "inventory": {
        "title": "المخازن",
        "description":
            "تسجيل المواد الخام والمنتجات الجاهزة، متابعة الكميات، تنبيه انخفاض المخزون، وجرد المخازن."
      }
    },
    "auth": {
      "sign_in": {
        "form": {
          "email": "البريد الإلكتروني",
          "hint_text_email": "أدخل بريدك الإلكتروني",
          "password": "كلمة المرور",
          "hint_text_password": "أدخل كلمة المرور الخاصة بك",
          "textFormField_validate": "حقل {title} مطلوب"
        },
        "remember_me": {
          "title": "تذكرني",
          "forgot_password": "هل نسيت كلمة المرور؟"
        },
        "screen_body": {
          "customQuickAlert_title": "نجاح",
          "customQuickAlert_message": "تم تسجيل الدخول بنجاح",
          "customQuickAlert_error_title": "خطأ",
          "customElevatedButton_name": "تسجيل الدخول",
          "haveAccountOrNot_title": "ليس لديك حساب؟",
          "haveAccountOrNot_value": "إنشاء حساب"
        }
      },
      "sign_up": {
        "form": {
          "user_name": "اسم المستخدم",
          "hint_text_user_name": "أدخل اسم المستخدم الخاص بك",
          "full_name": "الاسم الكامل",
          "hint_text_full_name": "أدخل اسمك الكامل",
          "email": "البريد الإلكتروني",
          "hint_text_email": "أدخل بريدك الإلكتروني",
          "phone_number": "رقم الهاتف",
          "hint_text_phone_number": "أدخل رقم هاتفك",
          "password": "كلمة المرور",
          "hint_text_password": "أدخل كلمة المرور الخاصة بك",
          "textFormField_validate": "حقل {title} مطلوب"
        },
        "screen_bodys": {
          "customQuickAlert_title": "نجاح",
          "customQuickAlert_message": "تم إنشاء الحساب بنجاح",
          "customQuickAlert_error_title": "خطأ",
          "customQuickAlert_info_title": "معلومة",
          "customElevatedButton_name": "إنشاء حساب",
          "haveAccountOrNot_title": "هل لديك حساب ؟ ",
          "haveAccountOrNot_value": "تسجيل الدخول"
        },
        "cubit": {
          "pickProfileImage": "الرجاء اختيار صورة",
          "signUp": "الرجاء اختيار صورة"
        }
      }
    },
    "sales_invoices": {
      "add_sales": {
        "customQuickAlert_title": "نجاح",
        "customQuickAlert_message": "تم إضافة فاتورة المبيعات بنجاح",
        "customQuickAlert_error_title": "خطأ",
        "customQuickAlert_warning_title": "تحذير",
        "customQuickAlert_selectCustomer_message": "الرجاء اختيار عميل",
        "customQuickAlert_selectProduct_message":
            "الرجاء إضافة منتج واحد على الأقل",
        "customQuickAlert_selectDueDate_message":
            "الرجاء اختيار تاريخ الاستحقاق",
        "customQuickAlert_selectPaymentMethod_message":
            "الرجاء اختيار طريقة الدفع",
        "customTitle": "إضافة فاتورة مبيعات",
        "Customer": "العميل",
        "Select_Customer": "اختر العميل",
        "productModel_title": "المنتج",
        "productModel_hintText": "اختر المنتج",
        "quantity_title": "الكمية",
        "quantity_hintText": "أدخل الكمية",
        "customQuickAlert_message2": "الرجاء إدخال كمية صحيحة واختيار منتج",
        "text": "لا توجد منتجات مضافة بعد",
        "product": "المنتج",
        "qty": "الكمية",
        "unitPrice": "سعر الوحدة",
        "total": "الإجمالي",
        "customDateTimeFormField_title": "تاريخ الاستحقاق",
        "customDateTimeFormField_hintText": "اختر التاريخ",
        "paymentMethod_title": "طريقة الدفع",
        "paymentMethod_hintText": "اختر طريقة الدفع",
        "subtotal": "المجموع الفرعي",
        "enterTax": "أدخل الضريبة",
        "tax": "الضريبة",
        "discount": "الخصم",
        "enter_discount": "أدخل الخصم",
        "notes": "ملاحظات",
        "enterYourNotes": "أدخل ملاحظاتك",
        "addInvoice": "إضافة الفاتورة",
        "screen_title": "فواتير المبيعات",
        "search_hintText": "ابحث عن المبيعات بالرقم ..."
      },
      "details_modal": {
        "customTitle_title": "تفاصيل فاتورة المبيعات",
        "ID": "المعرف",
        "Invoice_Number": "رقم الفاتورة",
        "Customer": "العميل",
        "Customer_ID": "معرف العميل",
        "Date": "التاريخ",
        "Due_Date": "تاريخ الاستحقاق",
        "No_Due_Date": "لا يوجد تاريخ استحقاق",
        "Status": "الحالة",
        "Payment_Method": "طريقة الدفع",
        "Subtotal": "المجموع الفرعي",
        "Tax": "الضريبة",
        "Discount": "الخصم",
        "Total": "الإجمالي",
        "Notes": "ملاحظات",
        "Created_At": "تاريخ الإنشاء",
        "Updated_At": "تاريخ التحديث"
      }
    },
    "purchases_invoices": {
      "details_modal": {
        "customTitle_title": "تفاصيل فاتورة المشتريات",
        "Supplier": "المورد",
        "Supplier_ID": "معرف المورد"
      },
      "add_purchase": {
        "customQuickAlert_message": "تم إضافة فاتورة المشتريات بنجاح",
        "SelectSupplier_message": "الرجاء اختيار مورد",
        "SelectDueDate_message": "الرجاء اختيار تاريخ استحقاق",
        "SelectPaymentMethod_message": "الرجاء اختيار طريقة دفع",
        "SelectItem_message": "الرجاء إضافة منتج أو مادة خام واحدة على الأقل",
        "CustomQuickAlert_message": "الرجاء اختيار منتج وإدخال كمية صحيحة",
        "Raw_Material": "المادة الخام",
        "Select_raw": "اختر المادة الخام",
        "please_raw": "الرجاء اختيار مادة خام وإدخال كمية صحيحة",
        "no_raw": "لا توجد مواد خام مضافة بعد",
        "CustomTitle": "إضافة فاتورة مشتريات",
        "Supplier": "المورد",
        "Select_Supplier": "اختر المورد",
        "Purchases": "المشتريات",
        "search_Purchases": "ابحث عن المشتريات بالرقم ..."
      },
      "pop_up": {
        "update": "تحديث",
        "delete": "حذف",
        "print": "طباعة",
        "share": "مشاركة"
      }
    },
    "DashBoardItemModel": {
      "Purchases": "المشتريات",
      "Sales": "المبيعات",
      "Suppliers": "الموردين",
      "Customers": "العملاء",
      "Expenses_Categories": "فئات المصروفات",
      "Expenses": "المصروفات",
      "Safe": "الخزنة",
      "Raw_Materials": "المواد الخام",
      "Categories": "الفئات",
      "Products": "المنتجات",
      "Bill_of_Materials": "قائمة المواد",
      "Manufacturing": "التصنيع"
    },
    "suppliers": {
      "add_supplier": {
        "CustomQuickAlert_message": "تم إضافة المورد بنجاح",
        "SelectContactPerson": "الرجاء اختيار شخص الاتصال",
        "SelectPaymentTerm": "الرجاء اختيار شروط الدفع",
        "customTitle": "إضافة مورد",
        "Supplier_Name": "اسم المورد",
        "enter_supplier_name": "أدخل اسم المورد",
        "Contact_Person": "شخص الاتصال",
        "select_contact_person": "اختر شخص الاتصال",
        "Phone": "رقم الهاتف",
        "enter_phone": "أدخل رقم الهاتف",
        "Email": "البريد الإلكتروني للمورد",
        "enter_email": "أدخل البريد الإلكتروني للمورد",
        "Address": "عنوان المورد",
        "enter_address": "أدخل عنوان المورد",
        "Payment_Terms": "شروط الدفع",
        "select_payment_terms": "أدخل شروط الدفع",
        "Credit_Limit": "الحد الائتماني",
        "enter_credit_limit": "أدخل الحد الائتماني",
        "Supplier_Balance": "رصيد المورد",
        "enter_supplier_balance": "أدخل رصيد المورد",
        "Add_Supplier": "إضافة مورد",
        "Suppliers_title": "الموردين",
        "search_hintText": "ابحث عن الموردين بالاسم ..."
      },
      "delete_supplier": {
        "CustomQuickAlert_message": "تم حذف المورد بنجاح",
        "CustomQuickAlert_title": "حذف المورد"
      },
      "details_modal": {
        "customTitle_title": "تفاصيل المورد",
        "ID": "المعرف",
        "Name": "الاسم",
        "Contact_Person": "شخص الاتصال",
        "Phone": "رقم الهاتف",
        "Email": "البريد الإلكتروني",
        "Address": "العنوان",
        "Tax_ID": "معرف الضريبة",
        "Payment_Terms": "شروط الدفع",
        "Credit_Limit": "الحد الائتماني",
        "Balance": "الرصيد",
        "Notes": "ملاحظات",
        "Created_At": "تاريخ الإنشاء",
        "No_Date": "لا يوجد تاريخ",
        "Updated_At": "تاريخ التحديث",
        "Suppliers_title": "الموردين",
        "search_hintText": "ابحث عن الموردين بالاسم ..."
      },
      "edit_supplier": {
        "supplier_updated": "تم تحديث المورد",
        "supplier_updated_message": "تم تحديث بيانات المورد بنجاح",
        "customQuickAlert_warning": "لم يتم إجراء أي تغييرات على المورد",
        "update_supplier": "تحديث المورد",
        "enter_contact_person": "أدخل شخص الاتصال"
      },
    },
    "customers": {
      "add_customer": {
        "CustomQuickAlert_message": "تم إضافة العميل بنجاح",
        "SelectContactPerson": "الرجاء اختيار شخص الاتصال",
        "SelectPaymentTerm": "الرجاء اختيار شروط الدفع",
        "customTitle": "إضافة عميل",
        "Customer_Name": "اسم العميل",
        "enter_customer_name": "أدخل اسم العميل",
        "Email": "البريد الإلكتروني للعميل",
        "enter_email": "أدخل البريد الإلكتروني للعميل",
        "Address": "عنوان العميل",
        "enter_address": "أدخل عنوان العميل",
        "Customer_Balance": "رصيد العميل",
        "enter_customer_balance": "أدخل رصيد العميل",
        "Add_Customer": "إضافة عميل",
        "Customers_title": "العملاء",
        "search_hintText": "ابحث عن العملاء بالاسم ...",
        "Customer_Details": "تفاصيل العميل"
      },
      "delete_customer": {
        "customQuickAlert_delete_message": "تم حذف العميل بنجاح"
      },
      "edit_customer": {
        "customer_updated": "تم تحديث العميل",
        "customer_updated_message": "تم تحديث بيانات العميل بنجاح",
        "no_changes": "لا توجد تغييرات",
        "no_changes_message": "لم يتم إجراء أي تغييرات على العميل",
        "update_customer": "تحديث العميل",
        "enter_contact_person": "أدخل شخص الاتصال",
        "enter_tax_iD": "أدخل الرقم الضريبي",
        "tax_iD": "الرقم الضريبي",
        "enter_payment_terms": "أدخل شروط الدفع"
      }
    },
    "expenses": {
      "add_expense": {
        "customQuickAlert_message": "تم إضافة المصروف بنجاح",
        "customQuickAlert_selectExpenseCategory_message":
            "الرجاء اختيار فئة المصروف",
        "customQuickAlert_selectPaymentMethod_message":
            "الرجاء اختيار طريقة الدفع",
        "customQuickAlert_selectExpenseDate_message": "الرجاء اختيار تاريخ",
        "customTitle": "إضافة مصروف",
        "Expenses_Category": "فئة المصروفات",
        "select_expenses_category": "اختر فئة المصروفات",
        "Reference": "المرجع",
        "enter_reference": "أدخل المرجع",
        "Amount": "المبلغ",
        "enter_amount": "أدخل المبلغ",
        "Payment_Method": "طريقة الدفع",
        "select_payment_method": "اختر طريقة الدفع",
        "Date": "التاريخ",
        "select_date": "اختر التاريخ",
        "Notes": "ملاحظات",
        "enter_notes": "أدخل الملاحظات",
        "Add_Expense": "إضافة مصروف",
        "expenses_title": "المصروفات",
        "search_hintText": "ابحث عن المصروفات بالمرجع ..."
      },
      "delete_expense": {
        "customQuickAlert_delete_message": "تم حذف المصروف بنجاح"
      },
      "details_modal": {
        "customTitle_title": "تفاصيل المصروف",
        "Reference": "المرجع",
        "Expense_Date": "تاريخ المصروف",
        "Amount": "المبلغ",
        "Payment_Method": "طريقة الدفع",
        "Notes": "ملاحظات",
        "No_Reference": "لا يوجد مرجع"
      }
    },
    "expenses_category": {
      "add_expense_category": {
        "customQuickAlert_message": "تم إضافة فئة المصروفات بنجاح",
        "customTitle": "إضافة فئة المصروفات",
        "expenses_Name": "اسم فئة المصروفات",
        "enter_expenses_name": "أدخل اسم فئة المصروفات",
        "expenses_Description": "وصف فئة المصروفات",
        "enter_expenses_description": "أدخل وصف فئة المصروفات",
        "Add_Expenses_Category": "إضافة فئة المصروفات",
        "expenses_category_title": "فئات المصروفات",
        "search_hintText": "ابحث عن فئات المصروفات"
      },
      "delete_expense_category": {
        "customQuickAlert_delete_message": "تم حذف فئة المصروفات بنجاح"
      },
      "details_modal": {
        "customTitle_title": "تفاصيل الفئة",
        "ID": "المعرف",
        "Name": "الاسم",
        "Description": "الوصف",
        "No_Description": "لا يوجد وصف",
        "Created_At": "تاريخ الإنشاء",
        "Updated_At": "تاريخ التحديث"
      },
      "edit_expenses_category": {
        "expenses_category": "تم تحديث فئة المصروفات بنجاح",
        "No_updates": "لم يتم إجراء أي تحديثات",
        "Update_Expenses_Category": "تحديث فئة المصروفات",
        "Update": "تحديث"
      },
    },
    "raw_materials": {
      "customQuickAlert_message": "تمت إضافة المادة الخام بنجاح",
      "UnitNotSelected": "يرجى اختيار وحدة",
      "customTitle": "إضافة مادة خام جديدة",
      "material_Name": "اسم المادة",
      "enter_material_name": "أدخل اسم المادة",
      "material_Description": "وصف المادة",
      "enter_material_description": "أدخل وصف المادة",
      "Material_Quantity": "كمية المادة",
      "enter_material_quantity": "أدخل كمية المادة",
      "Material_Unit": "وحدة المادة",
      "select_material_unit": "اختر وحدة المادة",
      "Add_Material": "إضافة مادة",
      "raw_materials_title": "المواد الخام",
      "search_hintText": "ابحث عن المواد الخام",
      "customTitle_title": "تفاصيل المادة الخام",
      "Unit": "الوحدة",
      "Current_Stock": "المخزون الحالي",
      "Raw_materal": "تم تحديث المادة الخام بنجاح",
      "No_updates": "لم يتم إجراء أي تحديثات",
      "Update_Raw_Material": "تحديث المادة الخام",
      "Enter_unit": "أدخل الوحدة (كجم، متر، إلخ)",
      "Enter_current_stock": "أدخل المخزون الحالي"
    },
    "categories": {
      "customQuickAlert_message": "تمت إضافة الفئة بنجاح",
      "customTitle": "إضافة فئة جديدة",
      "category_Name": "اسم الفئة",
      "enter_category_name": "أدخل اسم الفئة",
      "category_Description": "وصف الفئة",
      "enter_category_description": "أدخل وصف الفئة",
      "Add_Category": "إضافة فئة",
      "categories_title": "الفئات",
      "search_hintText": "ابحث عن الفئات",
      "customTitle_title": "تفاصيل الفئة",
      "Active": "نشط",
      "update_category": {
        "customQuickAlert_title": "نجاح",
        "customQuickAlert_error_title": "خطأ",
        "customQuickAlert_message_update": "تم تحديث الفئة بنجاح",
        "customQuickAlert_no_changes_message": "لم يتم إجراء أي تغييرات",
        "customTitle_update": "تحديث الفئة",
        "Update_Category": "تحديث الفئة",
        "is_active": "نشط",
        "customQuickAlert_warning": "تحذير"
      }
    },
    "products": {
      "add_product": {
        "customQuickAlert_message": "تمت إضافة المنتج بنجاح",
        "SelectCategory": "يرجى اختيار فئة",
        "SelectUnit": "يرجى اختيار وحدة",
        "customTitle": "إضافة منتج",
        "product_Name": "اسم المنتج",
        "enter_product_name": "أدخل اسم المنتج",
        "product_Description": "وصف المنتج",
        "enter_product_description": "أدخل وصف المنتج",
        "Product_Price": "سعر المنتج",
        "enter_product_price": "أدخل سعر المنتج",
        "Selling_Price": "سعر البيع",
        "enter_selling_price": "أدخل سعر البيع",
        "Profit": "الربح:{value}",
        "Select_Category": "اختر الفئة",
        "Select_Unit": "اختر الوحدة",
        "min_stock": "الحد الأدنى للمخزون",
        "current_stock": "المخزون الحالي",
        "Is_Manufacturer": "منتج مصنع",
        "Add_Product": "إضافة منتج",
        "Clear_All": "مسح الكل",
        "Delete": "حذف",
        "Update": "تحديث",
        "Pick_Image": "اختر صورة المنتج",
        "products_title": "المنتجات",
        "search_hintText": "ابحث عن اسم المنتج ..."
      },
      "delete_product": {
        "customQuickAlert_no_changes_message": "لم يتم إجراء أي تغييرات"
      },
      "product_details": {
        "customTitle_title": "تفاصيل المنتج",
        "ID": "المعرف",
        "Name": "الاسم",
        "Category_ID": "معرف الفئة",
        "Description": "الوصف",
        "No_Description": "لا يوجد وصف",
        "Purchase_Price": "سعر الشراء",
        "Selling_Price": "سعر البيع",
        "Manufactured": "مصنع",
        "Unit": "الوحدة",
        "Minimum_Stock": "الحد الأدنى للمخزون",
        "Current_Stock": "المخزون الحالي",
        "Created_At": "تاريخ الإنشاء",
        "Updated_At": "تاريخ التحديث"
      },
      "edit_product": {
        "Product_Updated": "تم تحديث المنتج",
        "Product_Updated_message": "تم تحديث المنتج بنجاح",
        "Update_Product": "تحديث المنتج",
        "Purchase_Pricase_price": "أدخل سعر الشراء",
        "Unit": "الوحدة",
        "Enter_unit": "أدخل الوحدة (مثال: كجم، متر)",
        "Min_Stock_Level": "الحد الأدنى للمخزون",
        "Enter_min_stock": "أدخل الحد الأدنى للمخزون",
        "Is_Manufactured": "هل هو منتج مصنع؟"
      },
    },
    "dash_board": {
      "Harrasi_Rope_Factory": "مصنع حبال الحراصي",
      "Admin": "مسؤول"
    },
    "bill_of_materials": {
      "Bill_of_material": "تمت إضافة قائمة المواد بنجاح",
      "SelectProduct": "من فضلك اختر منتج",
      "CustomTitle": "إضافة قائمة مواد",
      "Select_Product": "اختر منتج",
      "Bill_of_Materials_title": "قائمة المواد",
      "search_hintText": "ابحث عن قائمة المواد بالاسم ...",
      "update": {
        "customTitle_update": "تعديل قائمة المواد",
        "customQuickAlert_title": "قائمة المواد",
        "customQuickAlert_message_update": "تم تحديث قائمة المواد بنجاح!",
        "customQuickAlert_error_title": "خطأ",
        "customQuickAlert_no_changes_message": "لم يتم إجراء أي تغييرات.",
        "button": "تحديث قائمة المواد"
      },
      "name": "اسم قائمة المواد",
      "description": "وصف قائمة المواد",
      "enter_name": "ادخل اسم قائمة المواد",
      "enter_description": "ادخل وصف قائمة المواد",
      "customQuickAlert_delete_success": "تم حذف قائمة المواد بنجاح"
    },
    "bill_of_materials_item": {
      "Bill": "تمت إضافة عنصر قائمة المواد بنجاح",
      "SelectRawMaterial": "يرجى اختيار مادة خام",
      "SelectUnit": "يرجى اختيار وحدة",
      "CustomTitle": "إضافة عنصر قائمة مواد",
      "Description": "الوصف",
      "CustomTitle_title": "تفاصيل عنصر قائمة المواد",
      "Bill_ID": "معرف قائمة المواد",
      "Raw_ID": "معرف المادة الخام",
      "Raw_Material": "المادة الخام",
      "Item": "العنصر",
      "Bom_Items": "عناصر قائمة المواد",
      "search_hintText": "ابحث عن عنصر قائمة المواد بالاسم..."
    },
    "manufacture": {
      "customQuickAlert_message": "تمت إضافة أمر التصنيع بنجاح",
      "SelectStartDate": "يرجى اختيار تاريخ البدء",
      "SelectEndDate": "يرجى اختيار تاريخ الانتهاء",
      "SelectProduct": "يرجى اختيار منتج",
      "SelectBillOfMaterial": "يرجى اختيار قائمة المواد",
      "select_bill": "اختر قائمة المواد",
      "Start_Date": "تاريخ البدء",
      "enter": "أدخل وقت الانتهاء",
      "No_Product": "لا يوجد منتج",
      "Product_ID": "معرف المنتج",
      "BOM_ID": "معرف قائمة المواد",
      "Status": "الحالة",
      "No_Start_Date": "لا يوجد تاريخ بدء",
      "End_Date": "تاريخ الانتهاء",
      "No_End_Date": "لا يوجد تاريخ انتهاء",
      "Manufacturer_title": "التصنيع",
      "search_hintText": "ابحث عن أمر التصنيع بالاسم ...",
      "CustomTitle": "إضافة أمر تصنيع",
      "enter_start_time": "أدخل وقت البدء",
      "Manufacture_Details": "تفاصيل التصنيع",
      "Manufacture_updated": "تم تحديث أمر التصنيع بنجاح",
      "Info": "معلومة",
      "No_changes": "لم يتم إجراء أي تغييرات",
      "select_status": "اختر الحالة",
      "Update_Manufacture": "تحديث أمر التصنيع"
    },
    "settings_screen": {
      "title": "الإعدادات",
      "Profile": "الملف الشخصي",
      "Preferences": "التفضيلات",
      "Notifications": "الإشعارات",
      "Security_Privacy": "الأمان والخصوصية",
      "Account": "الحساب",
      "Help_Support": "المساعدة والدعم",
      "About": "حول التطبيق",
    },
    "current_language": "Ar",
    "skip": "تخطى",
    "Dark_Light_Mode": "الوضع الداكن والفاتح",
    "Translation": "الترجمة"
  };
  static const Map<String, dynamic> _en = {
    "onboarding": {
      "welcome": {
        "title": "Welcome",
        "description":
            "Welcome to our program for managing sales, manufacturing, accounting, invoices, and inventory."
      },
      "sales": {
        "title": "Sales",
        "description":
            "Register clients, create quotations, track orders, and generate daily, monthly, and yearly reports."
      },
      "manufacturing": {
        "title": "Manufacturing",
        "description":
            "Manage manufacturing orders, define raw materials, track production, and analyze worker/machine efficiency."
      },
      "accounting": {
        "title": "Accounting",
        "description":
            "Record revenues and expenses, manage bank and cash accounts, client and supplier statements, and financial reports."
      },
      "invoices": {
        "title": "Invoices",
        "description":
            "Sales, purchase, maintenance, and manufacturing invoices, payment collection, and searchable/printable archive."
      },
      "inventory": {
        "title": "Inventory",
        "description":
            "Register raw materials and finished products, track quantities, low stock alerts, and warehouse inventory."
      }
    },
    "auth": {
      "sign_in": {
        "form": {
          "email": "Email",
          "hint_text_email": "enter your email",
          "password": "Password",
          "hint_text_password": "enter your password",
          "textFormField_validate": "Field {title} is required"
        },
        "remember_me": {
          "title": "Remember me",
          "forgot_password": "Forgot Password ?"
        },
        "screen_body": {
          "customQuickAlert_title": "Success",
          "customQuickAlert_message": "Sign In Successfully",
          "customQuickAlert_error_title": "Error",
          "customElevatedButton_name": "Sign In",
          "haveAccountOrNot_title": "Don't have an account?",
          "haveAccountOrNot_value": "Sign Up"
        }
      },
      "sign_up": {
        "form": {
          "user_name": "User Name",
          "hint_text_user_name": "enter your user name",
          "full_name": "Full Name",
          "hint_text_full_name": "enter your full name",
          "email": "Email",
          "hint_text_email": "enter your email",
          "phone_number": "Phone Number",
          "hint_text_phone_number": "enter your phone number",
          "password": "Password",
          "hint_text_password": "enter your password",
          "textFormField_validate": "Field {title} is required"
        },
        "screen_bodys": {
          "customQuickAlert_title": "Success",
          "customQuickAlert_message": "Sign Up Successfully",
          "customQuickAlert_error_title": "Error",
          "customQuickAlert_info_title": "Info",
          "customElevatedButton_name": "Sign Up",
          "haveAccountOrNot_title": "Do you have an account ? ",
          "haveAccountOrNot_value": "Sign In"
        },
        "cubit": {
          "pickProfileImage": "No image selected",
          "signUp": "Please select an image"
        }
      }
    },
    "sales_invoices": {
      "add_sales": {
        "customQuickAlert_title": "Success",
        "customQuickAlert_message": "Sales Invoice Added Successfully",
        "customQuickAlert_error_title": "Error",
        "customQuickAlert_warning_title": "Warning",
        "customQuickAlert_selectCustomer_message": "Please select a customer",
        "customQuickAlert_selectProduct_message":
            "Please add at least one product",
        "customQuickAlert_selectDueDate_message": "Please select a due date",
        "customQuickAlert_selectPaymentMethod_message":
            "Please select a payment method",
        "customTitle": "Add Sales Invoice",
        "Customer": "Customer",
        "Select_Customer": "Select Customer",
        "productModel_title": "Product",
        "productModel_hintText": "Select product",
        "quantity_title": "Quantity",
        "quantity_hintText": "Enter quantity",
        "customQuickAlert_message2":
            "Please enter a valid quantity and select a product",
        "text": "No products added yet",
        "product": "Product",
        "qty": "Qty",
        "unitPrice": "Unit Price",
        "total": "Total",
        "customDateTimeFormField_title": "Due Date",
        "customDateTimeFormField_hintText": "Select date",
        "paymentMethod_title": "Payment Method",
        "paymentMethod_hintText": "Select payment method",
        "subtotal": "Subtotal",
        "enterTax": "Enter tax",
        "tax": "Tax",
        "discount": "Discount",
        "enter_discount": "Enter discount",
        "notes": "Notes",
        "enterYourNotes": "Enter your notes",
        "addInvoice": "Add Invoice",
        "screen_title": "Sales Invoices",
        "search_hintText": "search for sales by number ..."
      },
      "details_modal": {
        "customTitle_title": "Sale Invoice Details",
        "ID": "ID",
        "Invoice_Number": "Invoice Number",
        "Customer": "Customer",
        "Customer_ID": "Customer ID",
        "Date": "Date",
        "Due_Date": "Due Date",
        "No_Due_Date": "No Due Date",
        "Status": "Status",
        "Payment_Method": "Payment Method",
        "Subtotal": "Subtotal",
        "Tax": "Tax",
        "Discount": "Discount",
        "Total": "Total",
        "Notes": "Notes",
        "Created_At": "Created At",
        "Updated_At": "Updated At"
      }
    },
    "purchases_invoices": {
      "details_modal": {
        "customTitle_title": "Purchase Invoice Details",
        "Supplier": "Supplier",
        "Supplier_ID": "Supplier ID"
      },
      "add_purchase": {
        "customQuickAlert_message": "Purchase Invoice Added Successfully",
        "SelectSupplier_message": "Please select a supplier",
        "SelectDueDate_message": "Please select a due date",
        "SelectPaymentMethod_message": "Please select a payment method",
        "SelectItem_message": "Please add at least one product or raw material",
        "CustomQuickAlert_message":
            "Please select a product and enter a valid quantity",
        "Raw_Material": "Raw Material",
        "Select_raw": "Select Raw Material",
        "please_raw": "Please select a raw material and enter a valid quantity",
        "no_raw": "No raw materials added yet",
        "CustomTitle": "Add Purchase Invoice",
        "Supplier": "Supplier",
        "Select_Supplier": "Select Supplier",
        "Purchases": "Purchases",
        "search_Purchases": "search for purchases by number ..."
      },
      "pop_up": {
        "update": "Update",
        "delete": "Delete",
        "print": "Print",
        "share": "Share"
      }
    },
    "DashBoardItemModel": {
      "Purchases": "Purchases",
      "Sales": "Sales",
      "Suppliers": "Suppliers",
      "Customers": "Customers",
      "Expenses_Categories": "Expenses Categories",
      "Expenses": "Expenses",
      "Safe": "Safe",
      "Raw_Materials": "Raw Materials",
      "Categories": "Categories",
      "Products": "Products",
      "Bill_of_Materials": "Bill of Materials",
      "Manufacturing": "Manufacturing"
    },
    "suppliers": {
      "add_supplier": {
        "CustomQuickAlert_message": "Supplier Added Successfully",
        "SelectContactPerson": "Please select a contact person",
        "SelectPaymentTerm": "Please select a payment term",
        "customTitle": "Add Supplier",
        "Supplier_Name": "Supplier Name",
        "enter_supplier_name": "enter supplier name",
        "Contact_Person": "Contact Person",
        "select_contact_person": "select contact person",
        "Phone": "Phone Number",
        "enter_phone": "enter phone number",
        "Email": "Supplier Email",
        "enter_email": "enter supplier email",
        "Address": "Supplier Address",
        "enter_address": "enter supplier address",
        "Payment_Terms": "Payment Terms",
        "select_payment_terms": "enter payment terms",
        "Credit_Limit": "Credit Limit",
        "enter_credit_limit": "enter credit limit",
        "Supplier_Balance": "Supplier Balance",
        "enter_supplier_balance": "enter supplier balance",
        "Add_Supplier": "Add Supplier"
      },
      "delete_supplier": {
        "CustomQuickAlert_message": "Supplier Deleted Successfully",
        "CustomQuickAlert_title": "Delete Supplier"
      },
      "details_modal": {
        "customTitle_title": "Supplier Details",
        "ID": "ID",
        "Name": "Name",
        "Contact_Person": "Contact Person",
        "Phone": "Phone",
        "Email": "Email",
        "Address": "Address",
        "Tax_ID": "Tax ID",
        "Payment_Terms": "Payment Terms",
        "Credit_Limit": "Credit Limit",
        "Balance": "Balance",
        "Notes": "Notes",
        "Created_At": "Created At",
        "No_Date": "No Date",
        "Updated_At": "Updated At",
        "Suppliers_title": "Suppliers",
        "search_hintText": "search for suppliers by name ..."
      },
      "edit_supplier": {
        "supplier_updated": "Supplier Updated",
        "supplier_updated_message": "Supplier details updated successfully",
        "customQuickAlert_warning": "No changes were made to the supplier",
        "update_supplier": "Update Supplier",
        "enter_contact_person": "Enter contact person"
      }
    },
    "customers": {
      "add_customer": {
        "CustomQuickAlert_message": "Customer Added Successfully",
        "SelectContactPerson": "Please select a contact person",
        "SelectPaymentTerm": "Please select a payment term",
        "customTitle": "Add Customer",
        "Customer_Name": "Customer Name",
        "enter_customer_name": "enter customer name",
        "Email": "Customer Email",
        "enter_email": "enter customer email",
        "Address": "Customer Address",
        "enter_address": "enter customer address",
        "Customer_Balance": "Customer Balance",
        "enter_customer_balance": "enter customer balance",
        "Add_Customer": "Add Customer",
        "Customers_title": "Customers",
        "search_hintText": "search for customers by name ...",
        "Customer_Details": "Customer Details",
        "customQuickAlert_delete_message": "Customer deleted successfully"
      },
      "delete_customer": {
        "customQuickAlert_delete_message": "Customer deleted successfully"
      },
      "edit_customer": {
        "customer_updated": "Customer Updated",
        "customer_updated_message": "Customer details updated successfully",
        "no_changes": "No Changes",
        "no_changes_message": "No changes were made to the customer",
        "update_customer": "Update Customer",
        "enter_contact_person": "Enter contact person",
        "enter_tax_iD": "Enter Tax ID",
        "tax_iD": "Tax ID",
        "enter_payment_terms": "Enter Payment Terms"
      }
    },
    "expenses": {
      "add_expense": {
        "customQuickAlert_message": "Expense Added Successfully",
        "customQuickAlert_selectExpenseCategory_message":
            "Please select an expense category",
        "customQuickAlert_selectPaymentMethod_message":
            "Please select a payment method",
        "customQuickAlert_selectExpenseDate_message": "Please select a date",
        "customTitle": "Add Expense",
        "Expenses_Category": "Expenses Category",
        "select_expenses_category": "select expenses category",
        "Reference": "Reference",
        "enter_reference": "enter reference",
        "Amount": "Amount",
        "enter_amount": "enter amount",
        "Payment_Method": "Payment Method",
        "select_payment_method": "select payment method",
        "Date": "Date",
        "select_date": "select date",
        "Notes": "Notes",
        "enter_notes": "enter notes",
        "Add_Expense": "Add Expense",
        "expenses_title": "Expenses",
        "search_hintText": "search for expenses by reference ..."
      },
      "delete_expense": {
        "customQuickAlert_delete_message": "Expense deleted successfully"
      },
      "details_modal": {
        "customTitle_title": "Expense Details",
        "Reference": "Reference",
        "Expense_Date": "Expense Date",
        "Amount": "Amount",
        "Payment_Method": "Payment Method",
        "Notes": "Notes",
        "No_Reference": "No Reference"
      }
    },
    "expenses_category": {
      "add_expense_category": {
        "customQuickAlert_message": "Expense Category aded successfully",
        "customTitle": "Add Expenses Category",
        "expenses_Name": "Expenses Name",
        "enter_expenses_name": "enter expenses name",
        "expenses_Description": "Expenses Description",
        "enter_expenses_description": "enter expenses description",
        "Add_Expenses_Category": "Add Expenses Category",
        "expenses_category_title": "Expenses Categories",
        "search_hintText": "search for expenses categories"
      },
      "delete_expense_category": {
        "customQuickAlert_delete_message":
            "Expense Category deleted successfully"
      },
      "details_modal": {
        "customTitle_title": "Category Details",
        "ID": "ID",
        "Name": "Name",
        "Description": "Description",
        "No_Description": "No Description",
        "Created_At": "Created At",
        "Updated_At": "Updated_At"
      },
      "edit_expenses_category": {
        "expenses_category": "Expenses category updated successfully",
        "No_updates": "No updates were made",
        "Update_Expenses_Category": "Update Expenses Category",
        "Update": "Update"
      }
    },
    "raw_materials": {
      "customQuickAlert_message": "Raw material added successfully",
      "UnitNotSelected": "Please select a unit",
      "customTitle": "Add New Material",
      "material_Name": "Material Name",
      "enter_material_name": "enter material name",
      "material_Description": "Material Description",
      "enter_material_description": "enter material description",
      "Material_Quantity": "Material Quantity",
      "enter_material_quantity": "enter material quantity",
      "Material_Unit": "Material Unit",
      "select_material_unit": "select material unit",
      "Add_Material": "Add Material",
      "raw_materials_title": "Raw Materials",
      "search_hintText": "search for raw materials",
      "customTitle_title": "Raw Material Details",
      "Unit": "Unit",
      "Current_Stock": "Current Stock",
      "Raw_materal": "Raw material updated successfully",
      "No_updates": "No updates were made",
      "Update_Raw_Material": "Update Raw Material",
      "Enter_unit": "Enter unit (kg, m, etc.)",
      "Enter_current_stock": "Enter current stock"
    },
    "categories": {
      "customTitle": "Add New Category",
      "enter_category_name": "Enter category name",
      "enter_category_description": "Enter category description",
      "category_Name": "Category Name",
      "category_Description": "Category Description",
      "Add_Category": "Add Category",
      "customQuickAlert_message": "Category added successfully",
      "update_category": {
        "customTitle_update": "Edit Category",
        "customQuickAlert_title": "Updated Successfully",
        "customQuickAlert_error_title": "Update Failed",
        "customQuickAlert_message_update": "Category updated successfully",
        "customQuickAlert_no_changes_message": "No changes were made",
        "Update_Category": "Update Category",
        "is_active": "Active",
        "customQuickAlert_warning": "Warning"
      }
    },
    "products": {
      "add_product": {
        "customQuickAlert_message": "Product added successfully",
        "SelectCategory": "Please select a category",
        "SelectUnit": "Please select a unit",
        "customTitle": "Add Product",
        "product_Name": "Product Name",
        "enter_product_name": "enter product name",
        "product_Description": "Product Description",
        "enter_product_description": "enter product description",
        "Product_Price": "Product Price",
        "enter_product_price": "enter product price",
        "Selling_Price": "Selling Price",
        "enter_selling_price": "enter selling price",
        "Profit": "Profit:{value}",
        "Select_Category": "Select Category",
        "Select_Unit": "Select Unit",
        "min_stock": "Min Stock Level",
        "current_stock": "Current Stock",
        "Is_Manufacturer": "Is Manufacturer",
        "Add_Product": "Add Product",
        "Clear_All": "Clear All",
        "Delete": "Delete",
        "Update": "Update",
        "Pick_Image": "Pick Product Image",
        "products_title": "Products",
        "search_hintText": "search for product name ..."
      },
      "delete_product": {
        "customQuickAlert_delete_message": "Product deleted successfully"
      },
      "product_details": {
        "customTitle_title": "Product Details",
        "ID": "ID",
        "Name": "Name",
        "Category_ID": "Category ID",
        "Description": "Description",
        "No_Description": "No Description",
        "Purchase_Price": "Purchase Price",
        "Selling_Price": "Selling Price",
        "Manufactured": "Manufactured",
        "Unit": "Unit",
        "Minimum_Stock": "Minimum Stock Level",
        "Current_Stock": "Current Stock",
        "Created_At": "Created At",
        "Updated_At": "Updated At"
      },
      "edit_product": {
        "Product_Updated": "Product Updated",
        "Product_Updated_message": "Product updated successfully",
        "Update_Product": "Update Product",
        "Purchase_Pricase_price": "Enter purchase price",
        "Unit": "Unit",
        "Enter_unit": "Enter unit (e.g. Kg, m)",
        "Min_Stock_Level": "Min Stock Level",
        "Enter_min_stock": "Enter min stock level",
        "Is_Manufactured": "Is Manufactured?"
      }
    },
    "dash_board": {
      "Harrasi_Rope_Factory": "Harrasi Rope Factory",
      "Admin": "Admin"
    },
    "bill_of_materials": {
      "Bill_of_material": "Bill of material added successfully",
      "SelectProduct": "Please select a product",
      "CustomTitle": "Add Bill of Material",
      "Select_Product": "Select Product",
      "Bill_of_Materials_title": "Bill of Materials",
      "search_hintText": "Search for Bill of Materials by name ...",
      "update": {
        "customTitle_update": "Update Bill of Material",
        "customQuickAlert_title": "Bill of Material",
        "customQuickAlert_message_update":
            "Bill of Material updated successfully!",
        "customQuickAlert_error_title": "Error",
        "customQuickAlert_no_changes_message": "No changes were made.",
        "button": "Update Bill of Material"
      },
      "name": "Bill of Material Name",
      "description": "Bill of Material Description",
      "enter_name": "Enter Bill of Material Name",
      "enter_description": "Enter Bill of Material Description",
      "customQuickAlert_message": "Bill of Material added successfully",
      "customQuickAlert_delete_success": "Bill of Material deleted successfully"
    },
    "bill_of_materials_item": {
      "Bill": "Bill of material item added successfully",
      "SelectRawMaterial": "Please select a raw material",
      "SelectUnit": "Please select a unit",
      "CustomTitle": "Add Bom Item",
      "Description": "Description",
      "CustomTitle_title": "BOM Item Details",
      "Bill_ID": "Bill of Material ID",
      "Raw_ID": "Raw Material ID",
      "Raw_Material": "Raw Material",
      "Item": "Item",
      "Bom_Items": "BOM Items",
      "search_hintText": "search for a BOM item by name..."
    },
    "manufacture": {
      "customQuickAlert_message": "Manufacture Added Successfully",
      "SelectStartDate": "Select Start Date",
      "SelectEndDate": "Select End Date",
      "SelectProduct": "Select Product",
      "SelectBillOfMaterial": "Select Bill of Material",
      "select_bill": "select bill of material",
      "Start_Date": "Start Date",
      "enter": "enter end time",
      "No_Product": "No Product",
      "Product_ID": "Product ID",
      "BOM_ID": "BOM ID",
      "Status": "Status",
      "No_Start_Date": "No Start Date",
      "End_Date": "End Date",
      "No_End_Date": "No End Date",
      "Manufacturer_title": "Manufacture",
      "search_hintText": "search for manufacture by name ...",
      "CustomTitle": "Add Manufacture",
      "enter_start_time": "enter start time",
      "Manufacture_Details": "Manufacture Details",
      "Manufacture_updated": "Manufacture updated successfully",
      "Info": "Info",
      "No_changes": "No changes were made",
      "select_status": "select_status",
      "Update_Manufacture": "Update Manufacture"
    },
    "settings_screen": {
      "title": "Settings",
      "Profile": "Profile",
      "Preferences": "Preferences",
      "Notifications": "Notifications",
      "Security_Privacy": "Security & Privacy",
      "Account": "Account",
      "Help_Support": "Help & Support",
      "About": "About App",
    },
    "current_language": "EN",
    "skip": "Skip",
    "Dark_Light_Mode": "Dark & Light Mode",
    "Translation": "Translation"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": _ar,
    "en": _en
  };
}

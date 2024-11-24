package com.finlit.finlitiso.dbmodels;

import lombok.Data;

@Data
public class PageModel {
    private String pageName;
    private String title;
    private String message;
    private String buttonMessage;
    private boolean exception = false;
}

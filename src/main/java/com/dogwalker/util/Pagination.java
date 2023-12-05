package com.dogwalker.util;

public class Pagination {
    private int page;
    private int pageSize;
    private int totalItems;

    public Pagination(int page, int pageSize, int totalItems) {
        this.page = page;
        this.pageSize = pageSize;
        this.totalItems = totalItems;
    }

    public int getTotalPages() {
        return (int) Math.ceil((double) totalItems / pageSize);
    }

    public int getStartPage() {
        return (page - 1) / 10 * 10 + 1;
    }

    public int getEndPage() {
        int totalPages = getTotalPages();
        return Math.min(getStartPage() + 9, totalPages);
    }

    public int getOffset() {
        return (page - 1) * pageSize;
    }
}
